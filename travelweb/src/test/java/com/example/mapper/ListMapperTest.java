package com.example.mapper;

import java.util.Date;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.travel.domain.ListVO;
import com.travel.mapper.ListMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ListMapperTest {
	
	@Autowired
	private ListMapper listMapper;
	
	@Test
	public void testInsert() {
		Random random = new Random();
		
		for(int i=1; i<=50; i++) {
			ListVO listVO = new ListVO();
			
			int num = listMapper.nextNum(); //insert할 새글번호
			
			listVO.setEstnum(num);
			listVO.setEstname("김씨아저씨");
			listVO.setEstemail("이메일번호@"+i);
			listVO.setEsttel("010-2323-2323");
			listVO.setEsttitle("제목은"+num);
			listVO.setEstday("2021-09-21");
			listVO.setEsttraffic("버스");
			listVO.setEstcontent("기어서 갈수있나요?");
			
			listMapper.insert(listVO);
		}
	}
	
}
