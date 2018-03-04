package ${bussiPackage}.controller.${entityPackage};

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gosling.controller.BaseController;
import com.gosling.core.ResultCode;

import ${bussiPackage}.entity.${entityPackage}.${entityName};
import ${bussiPackage}.service.${entityPackage}.${entityName}Service;

/**
 * 
 * @类描述：${ftl_description}
 * @项目名称：gosling-controller
 * @包名�?${bussiPackage}.controller.${entityPackage}
 * @类名称：${entityName}Controller
 * @创建人：快敲网络出品-�?术交流请移步Q群：327947585
 * @创建时间�?${.now}
 */
@Controller
@RequestMapping(value = "${entityName?uncap_first}")
public class ${entityName}Controller extends BaseController {

	/***注入业务service�?*/
	@Resource
	private ${entityName}Service							${entityName?uncap_first}Service;
	
	/***静�?�链�?*/
	public static final String LIST = "list.html";//列表页面
	public static final String ADD = "add.html";//添加页面
	public static final String CREATE = "create.html";//新增操作
	public static final String EDIT = "edit.html";//编辑页面
	public static final String UPDATE = "update.html";//更新操作
	
	/**
	 * ${ftl_description}列表 页面跳转
	 * @param request
	 * @param response
	 * @param dataMap
	 * @return
	 */
	@RequestMapping(value = ${entityName}Controller.LIST,method = {RequestMethod.GET })
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,
            Map<String, Object> dataMap){
		return new ModelAndView("${entityPackage}/list");
	}
	
	/**
	 * ${ftl_description}新增页面跳转
	 * @param request
	 * @param dataMap
	 * @return
	 */
	@RequestMapping(value = ${entityName}Controller.ADD,method = {RequestMethod.GET })
	public ModelAndView add(HttpServletRequest request, Map<String, Object> dataMap) {
		return new ModelAndView("${entityPackage}/add");
	}
	
	/**
	 * 添加${ftl_description}
	 * @param member
	 * @param request
	 * @param dataMap
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = ${entityName}Controller.CREATE, method = { RequestMethod.POST })
    @ResponseBody
    public ResultCode<Object> create(${entityName} ${entityName?uncap_first}, HttpServletRequest request,
                                         Map<String, Object> dataMap) {
		Integer code = ${entityName?uncap_first}Service.insert(${entityName?uncap_first});
		if(code==1){
			return ResultCode.newRightCode("添加成功");
		}else{
			return ResultCode.newErrorCode("添加失败");
		}
	}
	
	/**
	 * ${ftl_description}编辑页面跳转
	 * @param request
	 * @param id
	 * @param dataMap
	 * @return
	 */
	@RequestMapping(value = ${entityName}Controller.EDIT, method = { RequestMethod.GET })
    public ModelAndView edit(HttpServletRequest request, Integer id, Map<String, Object> dataMap){
		${entityName} ${entityName?uncap_first} = ${entityName?uncap_first}Service.getById(id);
		dataMap.put("${entityName?uncap_first}", ${entityName?uncap_first});
		return new ModelAndView("${entityPackage}/edit");
	}
	
	/**
	 * 更新${ftl_description}
	 * @param member
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = ${entityName}Controller.UPDATE, method = { RequestMethod.POST })
    @ResponseBody
    public ResultCode<Object> update(${entityName} ${entityName?uncap_first}, HttpServletRequest request) {
		Integer code = ${entityName?uncap_first}Service.update(${entityName?uncap_first});
		if(code==1){
			return ResultCode.newRightCode("更新成功");
		}else{
			return ResultCode.newErrorCode("更新失败");
		}
	}
	
}
