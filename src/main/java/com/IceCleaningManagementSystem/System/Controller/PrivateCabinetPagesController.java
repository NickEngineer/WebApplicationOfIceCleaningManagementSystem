package com.SmartBuildingManagementSystem.System.Controller;

import com.SmartBuildingManagementSystem.System.Model.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.enterprise.inject.Model;

@Controller
@RequestMapping("/private-cabinet")
public class PrivateCabinetPagesController {

    @RequestMapping(value = "/smart-ventilation", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView getSmartVentilationPage() {
        ModelAndView smartVentilationCabinetModelAndView = new ModelAndView("SmartVentilation");
        smartVentilationCabinetModelAndView.addObject( "usersDevice", new Device());
        return smartVentilationCabinetModelAndView;
    }

    @RequestMapping(value = "/smart-ventilation/add-device", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView getAddDevicePage() {
        ModelAndView addDeviceModelAndView = new ModelAndView("AddDevice");

        return addDeviceModelAndView.addObject("deviceFromServer", new Device());
    }

    @RequestMapping(value = "/smart-ventilation/smart-device", method = RequestMethod.POST)
    public @ResponseBody
    ModelAndView getSmartDevicePage(@ModelAttribute("usersDevice") Device device) {
        ModelAndView smartDeviceModelAndView = new ModelAndView("VentilationDevice");

        return smartDeviceModelAndView;
    }

}
