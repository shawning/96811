package com.mp.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * NewsControllercontroller类
 * 
 **/
@Controller
@RequestMapping("/in")
public class IndexController {
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
		return "../index";
	}
	@RequestMapping("/news")
	public String news() {
		return "../news";
	}
	/**
	 * 货运出租
	 * @return
	 */
	@RequestMapping("/cargoRental")
	public String cargoRental() {
		return "../../cargoRental";
	}
	/**
	 * 常见问题
	 * @return
	 */
	@RequestMapping("/commonProblem")
	public String commonProblem() {
		return "../../commonProblem";
	}
	/**
	 * 联系我们
	 * @return
	 */
	@RequestMapping("/contactUs")
	public String contactUs() {
		return "../../contactUs";
	}
	/**
	 * 公司简介
	 * @return
	 */
	@RequestMapping("/aboutCompany")
	public String aboutCompany() {
		return "../../aboutCompany";
	}
	/**
	 * 市内配送
	 * @return
	 */
	@RequestMapping("/distributionCity")
	public String distributionCity() {
		return "../../distributionCity";
	}
	/**
	 * 危化品运输
	 * @return
	 */
	@RequestMapping("/distributionDangerous")
	public String distributionDangerous() {
		return "../../distributionDangerous";
	}
	/**
	 * 招聘信息
	 * @return
	 */
	@RequestMapping("/jobOffers")
	public String jobOffers() {
		return "../../jobOffers";
	}
	/**
	 * 新闻公告
	 * @return
	 */
	@RequestMapping("/pressReleases")
	public String pressReleases() {
		return "../../pressReleases";
	}
	/**
	 * 成功案例
	 * @return
	 */
	@RequestMapping("/successCase")
	public String successCase() {
		return "../../successCase";
	}
	/**
	 * 投诉建议
	 * @return
	 */
	@RequestMapping("/suggestions")
	public String suggestions() {
		return "../../Suggestions";
	}
	/**
	 * 市内搬场
	 * @return
	 */
	@RequestMapping("/trackbacksCity")
	public String trackbacksCity() {
		return "../../trackbacksCity";
	}
	/**
	 * 国际搬场
	 * @return
	 */
	@RequestMapping("/trackbacksInternational")
	public String trackbacksInternational() {
		return "../../trackbacksInternational";
	}
	/**
	 * 开票
	 * @return
	 */
	@RequestMapping("/ticket")
	public String ticket() {
		return "../../ticket";
	}
	/**
	 * 优惠券
	 * @return
	 */
	@RequestMapping("/conpons")
	public String conpons() {
		return "../../conpons";
	}
	
}
