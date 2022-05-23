xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/consultartarifaservicio/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_ConsultarTarifaServicio.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/consultartarifaservicio/v2";
(:: import schema at "../Schemas/EF_OF_ConsultarTarifaServicio.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarTarifaServicio) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarTarifaServicio) ::)) as element() (:: schema-element(ns2:salidaConsultarTarifaServicio) ::) {
    <ns2:salidaConsultarTarifaServicio>
        
        
        <ns2:serviciosTarifados>
            {
                for $servicioTarifado in $payloadResponse/*:serviciosTarifados/*:servicioTarifado
                return 
                <ns2:servicioTarifado>
                    <ns2:tipoServicio>{fn:data($servicioTarifado/*:tipoServicio)}</ns2:tipoServicio>
                    <ns2:subtipoServicio>{fn:data($servicioTarifado/*:subtipoServicio)}</ns2:subtipoServicio>
                    <ns2:valorServicio>{fn:data($servicioTarifado/*:valorServicio)}</ns2:valorServicio>
                    {
                        if ($servicioTarifado/*:direccionPredio)
                        then <ns2:direccionPredio>{fn:data($servicioTarifado/*:direccionPredio)}</ns2:direccionPredio>
                        else ()
                    }
                    {
                        if ($servicioTarifado/*:estadoPredio)
                        then <ns2:estadoPredio>{fn:data($servicioTarifado/*:estadoPredio)}</ns2:estadoPredio>
                        else ()
                    }</ns2:servicioTarifado>
            }
        </ns2:serviciosTarifados>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaConsultarTarifaServicio>
};

local:func($payloadResponse)