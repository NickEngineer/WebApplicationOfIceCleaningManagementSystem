package com.SmartBuildingManagementSystem.System.Controller;

import com.SmartBuildingManagementSystem.System.Model.Device;
import com.SmartBuildingManagementSystem.System.Service.DeviceSerivce;
import com.SmartBuildingManagementSystem.System.Service.RealDeviceService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Map;


@Controller
@RequestMapping("/private-cabinet")
public class PrivateCabinetActionsController {

    @Autowired
    private DeviceSerivce deviceSerivce;

    @Autowired
    private RealDeviceService realDeviceService;

    @RequestMapping(value = "/smart-ventilation/add-device/execute", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView addNewDevice(@ModelAttribute("deviceFromServer") Device device) {
        deviceSerivce.addNewDevice(device);
        ModelAndView smartVentilationPageModelAndView = new ModelAndView("redirect:/private-cabinet/smart-ventilation");
        return smartVentilationPageModelAndView;
    }

    @RequestMapping(value = "/smart-ventilation/smart-device/execute-query/todevice",
            method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    Map<String, String> executeQueryToRealDevice(@RequestParam("query") String query,
                                    HttpServletResponse responseHeader) throws Exception {


        String temp1 = realDeviceService.executeQueryToRealDevice(query);

        /*JSONObject myObj = new JSONObject();
        myObj.append("response", response);

        String string = "onAjaxSuccess( [{ \"x\": 10}] )";*/


        return Collections.singletonMap("temp1", temp1);
    }


}
