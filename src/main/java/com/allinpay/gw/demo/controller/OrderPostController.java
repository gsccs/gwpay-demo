package com.allinpay.gw.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allinpay.ets.client.SecurityUtil;

/**
 * 提交订单DEMO
 * @author x.d zhang
 *
 */
@Controller
public class OrderPostController {
	
	/**
	 * 提交页面
	 * @param id
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String orderPage(HttpServletRequest request, ModelMap map) {
		return "/demo/post_req";
	}
	
	/**
	 * 提交订单接口
	 * @param id
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String orderPost(HttpServletRequest request, ModelMap map) {
		String serverUrl = request.getParameter("serverUrl");
		String key=request.getParameter("key");
		String version=request.getParameter("version");
		String language=request.getParameter("language");
		String inputCharset= request.getParameter("inputCharset");
		String merchantId=request.getParameter("merchantId");
		String pickupUrl=request.getParameter("pickupUrl");
		String receiveUrl=request.getParameter("receiveUrl");
		String payType=request.getParameter("payType");
		String signType=request.getParameter("signType");
		String orderNo=request.getParameter("orderNo");
		String orderAmount=request.getParameter("orderAmount");
		String orderDatetime=request.getParameter("orderDatetime");
		String orderCurrency=request.getParameter("orderCurrency");
		String orderExpireDatetime=request.getParameter("orderExpireDatetime");
		String payerTelephone=request.getParameter("payerTelephone");
		String payerEmail=request.getParameter("payerEmail");
		String payerName=request.getParameter("payerName");
		String payerIDCard=request.getParameter("payerIDCard");
		String pid=request.getParameter("pid");
		String productName=request.getParameter("productName");
		String productId=request.getParameter("productId");
		String productNum=request.getParameter("productNum");
		String productPrice=request.getParameter("productPrice");
		String productDesc=request.getParameter("productDesc");
		String ext1=request.getParameter("ext1");
		String ext2=request.getParameter("ext2");
		String extTL=request.getParameter("extTL");//通联商户拓展业务字段，在v2.2.0版本之后才使用到的，用于开通分账等业务
		String issuerId=request.getParameter("issuerId");
		String pan=request.getParameter("pan");
		String tradeNature = request.getParameter("tradeNature");
		String sign="";
		
		//若直连telpshx渠道，payerTelephone、payerName、payerIDCard、pan四个字段不可为空
		//其中payerIDCard、pan需使用公钥加密（PKCS1格式）后进行Base64编码
		if(null!=payerIDCard&&!"".equals(payerIDCard)){
			try{
				//payerIDCard = SecurityUtil.encryptByPublicKey("C:\\TLCert.cer", payerIDCard);
				payerIDCard = SecurityUtil.encryptByPublicKey("/opt/conf/TLCert.cer", payerIDCard);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(null!=pan&&!"".equals(pan)){
			try{
				pan = SecurityUtil.encryptByPublicKey("/opt/conf/TLCert.cer", pan);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//构造订单请求对象，生成signMsg。
		com.allinpay.ets.client.RequestOrder requestOrder = new com.allinpay.ets.client.RequestOrder();
		if(null!=inputCharset&&!"".equals(inputCharset)){
			requestOrder.setInputCharset(Integer.parseInt(inputCharset));
		}
		requestOrder.setPickupUrl(pickupUrl);
		requestOrder.setReceiveUrl(receiveUrl);
		requestOrder.setVersion(version);
		if(null!=language&&!"".equals(language)){
			requestOrder.setLanguage(Integer.parseInt(language));
		}
		requestOrder.setSignType(Integer.parseInt(signType));
		requestOrder.setPayType(Integer.parseInt(payType));
		requestOrder.setIssuerId(issuerId);
		requestOrder.setMerchantId(merchantId);
		requestOrder.setPayerName(payerName);
		requestOrder.setPayerEmail(payerEmail);
		requestOrder.setPayerTelephone(payerTelephone);
		requestOrder.setPayerIDCard(payerIDCard);
		requestOrder.setPid(pid);
		requestOrder.setOrderNo(orderNo);
		requestOrder.setOrderAmount(Long.parseLong(orderAmount));
		requestOrder.setOrderCurrency(orderCurrency);
		requestOrder.setOrderDatetime(orderDatetime);
		requestOrder.setOrderExpireDatetime(orderExpireDatetime);
		requestOrder.setProductName(productName);
		if(null!=productPrice&&!"".equals(productPrice)){
			requestOrder.setProductPrice(Long.parseLong(productPrice));
		}
		if(null!=productNum&&!"".equals(productNum)){
			requestOrder.setProductNum(Integer.parseInt(productNum));
		}	
		requestOrder.setProductId(productId);
		requestOrder.setProductDesc(productDesc);
		requestOrder.setExt1(ext1);
		requestOrder.setExt2(ext2);
		requestOrder.setExtTL(extTL);	//通联商户拓展业务字段，在v2.2.0版本之后才使用到的，用于开通分账等业务
		requestOrder.setPan(pan);
		requestOrder.setTradeNature(tradeNature);
		requestOrder.setKey(key); 		//key为MD5密钥，密钥是在通联支付网关会员服务网站上设置。

		String strSrcMsg = requestOrder.getSrc(); // 此方法用于debug，测试通过后可注释。
		String strSignMsg = requestOrder.doSign(); // 签名，设为signMsg字段值。
		
		map.put("requestOrder", requestOrder);
		map.put("strSrcMsg", strSrcMsg);
		map.put("strSignMsg", strSignMsg);
		map.put("serverUrl", serverUrl);
		return "/demo/post";
	}

	
}
