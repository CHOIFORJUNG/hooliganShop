package com.spring.hooliganShop;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // 스프링 MVC를 테스트하는데 있어서 필요한 어노테이션 (기존의 다른 스프링 프로젝트에는 이 어노테이션 안들어감)
@ContextConfiguration(
      locations = {"file:/src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ControllerTest {
   private static final Logger logger = LoggerFactory.getLogger(ControllerTest.class);
   
   @Inject
   private WebApplicationContext webAppCtx;
   
   private MockMvc mockMvc; // MockMvc는 브라우저에서 응답과 요청을 하는 객체 (요놈이 톰캣 없이 controller 테스트 해야하니, 그 역할을 해준다고 보면 됨)
   
   @Before  // 매번 테스트 메소드 실행 전에 이걸 먼저 실행
   public void setup(){
      this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webAppCtx).build();
      logger.info("setup()호출.....");
   }
   
   @Test
   public void testController() throws Exception{  // 가장으로 요청하는 메소드
      mockMvc.perform(MockMvcRequestBuilders.get("/controller")); //post 또는 get으로 가능
   }
   
}