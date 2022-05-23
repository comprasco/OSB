xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/consultartarifaalertastitulares/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ConsultarTarifaAlertasTitulares.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/consultartarifaalertastitulares/v1";
(:: import schema at "../Schemas/EE_GAT_ConsultarTarifaAlertasTitulares.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarTarifaAlertasTitulares) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarTarifaAlertasTitulares) ::)) as element() (:: schema-element(ns2:salidaConsultarTarifaAlertasTitulares) ::) {
    <ns2:salidaConsultarTarifaAlertasTitulares>
        
        
        <ns2:tarifas>
            {
                for $tarifa in $payloadResponse/*:tarifas/ns1:tarifa
                return 
                <ns2:tarifa>
                    <ns2:rango>{fn:data($tarifa/*:rango)}</ns2:rango>
                    <ns2:valor>{fn:data($tarifa/*:valor)}</ns2:valor></ns2:tarifa>
            }
        </ns2:tarifas>
        {
            if ($payloadResponse/*:alertasInscrtitas)
            then <ns2:alertasInscrtitas>{fn:data($payloadResponse/*:alertasInscrtitas)}</ns2:alertasInscrtitas>
            else ()
        }
        {
            if ($payloadResponse/*:tarifaNuevasAlertas)
            then <ns2:tarifaNuevasAlertas>{fn:data($payloadResponse/*:tarifaNuevasAlertas)}</ns2:tarifaNuevasAlertas>
            else ()
        }
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaConsultarTarifaAlertasTitulares>
};

local:func($payloadResponse)