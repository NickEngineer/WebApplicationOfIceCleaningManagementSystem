package com.SmartBuildingManagementSystem.System.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/private-cabinet")
public class PrivateCabinetPagesController {

    @RequestMapping(value = "/smart-ventilation", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView getSmartVentilationPage() {
        ModelAndView privateCabinetModelAndView = new ModelAndView("SmartVentilation");

        return privateCabinetModelAndView;
    }


}
