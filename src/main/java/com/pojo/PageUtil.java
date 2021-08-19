package com.pojo;

public class PageUtil {
	// ÿҳ��ʾ������ 5
	 private int pageSize;
	  // �ܹ�������
	 private int recordCount;
	  // ��ǰҳ�� 2
	 private Integer currentPage;
	 //��ҳ��
	 public int pageCount;
	 //��һҳ�����һ����¼
	 private int start;
	 //��ǰҳ�����һ����¼
	 private int end;

	 public int getStart() {
		 start=(currentPage - 1) * pageSize;
		return start;
	}
	 //Ϊmysqlд�� select * from table limit start,end;
	 //limit�����Ʋ�ѯ��start+1��ʼ������ѯend������
	public int getEnd() {
		end=pageSize;
		return end;
	}

	public PageUtil(int pageSize, int recordCount, int currentPage) {
	   this.pageSize = pageSize;
	   this.recordCount = recordCount;
	   setCurrentPage(currentPage);
	  }

	 // ���췽��
	 public PageUtil(int pageSize, int recordCount) {
	   this(pageSize, recordCount, 1);
	  }
	
	 public PageUtil() {
			super();
			// TODO Auto-generated constructor stub
	}

	 // ��ҳ��
	 public int getPageCount() {
	   // ������/ÿҳ��ʾ������=��ҳ��
	  int size = recordCount / pageSize;
	   // ���һҳ������
	  int mod = recordCount % pageSize;
	   if (mod != 0)
	    size++;
	   this.pageCount=recordCount == 0 ? 1 : size;
	   return this.pageCount;
	  }

	 // ��������ʼ����Ϊ0,Ϊoracleʹ��
	  public int getFromIndex() {
	   // System.out.println("from index:"+(currentPage-1) * pageSize);
	   return (currentPage - 1) * pageSize;
	  }

	 // ������
	 public int getToIndex() {
	   // System.out.println("to index:"+Math.min(recordCount, currentPage *
	   // pageSize));
	   return Math.min(recordCount, currentPage * pageSize);
	  }

	 // �õ���ǰҳ
	 public int getCurrentPage() {
	   return currentPage;
	  }

	 // ���õ�ǰҳ
	 public void setCurrentPage(int currentPage) {
	   int validPage = currentPage <= 0 ? 1 : currentPage;
	   validPage = validPage > getPageCount() ? getPageCount() : validPage;
	   this.currentPage = validPage;
	  }

	 // �õ�ÿҳ��ʾ������
	 public int getPageSize() {
	   return pageSize;
	  }

	 // ����ÿҳ��ʾ������
	 public void setPageSize(int pageSize) {
	   this.pageSize = pageSize;
	  }

	 // �õ��ܹ�������
	 public int getRecordCount() {
	   return recordCount;
	  }

	 // �����ܹ�������
	 public void setRecordCount(int recordCount) {
	   this.recordCount = recordCount;
	  }

	
	 
	 

}
