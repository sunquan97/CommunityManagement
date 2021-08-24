package com.util;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.charset.Charset;
import java.util.Map;

public class SendData {
    private static Logger log= LoggerFactory.getLogger(com.util.SendData.class);
    /**
     * 方法说明：pot方法
     * @param url 地址
     * @param headers 请求头 null
     * @param param 请求参数
     * @return 返回请求结果
     * @throws Exception
     */
    static public Response doPost(String url, Map<String, String> headers, String param, boolean file)
            throws Exception {
        Response response = null;
        log.info("=============，处理开始");
        HttpPost httpPost = new HttpPost(url);
        if (headers != null) {
            for (Map.Entry<String, String> header : headers.entrySet()) {
                httpPost.addHeader(header.getKey(), header.getValue());
            }
        }
        log.info("=============发送前组装的的url>>>>>>>>>>>>"+url);
        StringEntity entity = new StringEntity(param, Charset.forName("UTF-8"));
        entity.setContentType("application/json; charset=utf-8");
        httpPost.setEntity(entity);
        HttpResponse httpResponse = gethttpClient().execute(httpPost);
        HttpEntity httpEntity = httpResponse.getEntity();
        int repStatus = httpResponse.getStatusLine().getStatusCode();
        if (repStatus == 200) {
            if (file) {
                byte[] resultByte = EntityUtils.toByteArray(httpEntity);
                response = new Response(repStatus, resultByte);
            } else {
                String result = EntityUtils.toString(httpEntity, "UTF-8");
                response = new Response(repStatus, result);
            }
            httpPost.releaseConnection();
            log.info("发送业务相关数据=============返回信息为{}"+response);
            return response;
        }
        httpPost.releaseConnection();
        log.error("发送业务相关失败=============请求指定 " + url + " 失败，状态码：" + repStatus);
        throw new Exception("请求指定 " + url + " 失败，状态码：" + repStatus);

    }
    static private HttpClient gethttpClient() {
        Registry<ConnectionSocketFactory> registry;
        registry = RegistryBuilder.<ConnectionSocketFactory>create()
                .register("http", PlainConnectionSocketFactory.getSocketFactory())
                .register("https", SSLConnectionSocketFactory.getSocketFactory()).build();

        PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager(registry);
        connectionManager.setMaxTotal(5);
        connectionManager.setDefaultMaxPerRoute(5);

        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(200*1000).setConnectTimeout(200*1000)
                .setConnectionRequestTimeout(200*1000).build();

        return HttpClientBuilder.create().setDefaultRequestConfig(requestConfig).setConnectionManager(connectionManager)
                .build();
    }
    static public class Response {

        private int status;
        private String resultStr;
        private byte[] resultByte;

        public Response() {
        }

        public Response(int status, String resultStr) {
            this.status = status;
            this.resultStr = resultStr;
        }

        public Response(int status, byte[] resultByte) {
            this.status = status;
            this.resultByte = resultByte;
        }

        public int getStatus() {
            return status;
        }

        public byte[] getResultByte() {
            return resultByte;
        }

        public String getResultStr() {
            return resultStr;
        }

        @Override
        public String toString() {
            return "Response [status=" + status + ", result=" + resultStr + "]";
        }

    }


}
