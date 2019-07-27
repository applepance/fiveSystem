package cn.five.testsys.test;

import cn.five.testsys.entity.*;

import java.util.List;

import cn.five.testsys.dao.*;

public class list_test {
	public static void main(String[] args) {
		GoodDao goodDao=new GoodDao();
		List<Good> list=goodDao.getGood_allwait("waiting");
		int countaid = list.size();
		int i=0;
		while(i<countaid){
			Good good=list.get(i);
			i +=1;
			System.out.println(good.getGname());
		}
		
	}
}
