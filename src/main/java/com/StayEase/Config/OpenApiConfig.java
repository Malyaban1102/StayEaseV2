package com.StayEase.Config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeIn;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.info.Contact;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.security.SecurityScheme;

@OpenAPIDefinition(
        info= @Info(
                title= "StayEase",
                description = "# Key Features\n"+
                        "* First Register, Important (email & password)\n" +
                        "* Customer, Admin, Manager can Login using (email & password)\n" +
                        "* JWT Token get after Login, Then you can access any Apis, Access Denied for Specific Role\n",
                contact = @Contact(
                        url = "www.linkedin.com/in/malyaban-ganguly"

                )
        )
)
@SecurityScheme(
        name = "BasicAuth",
        in = SecuritySchemeIn.HEADER,
        type = SecuritySchemeType.HTTP,
        bearerFormat = "JWT",
        scheme = "bearer",
        description = "JWT Token"


)

public class OpenApiConfig {

}