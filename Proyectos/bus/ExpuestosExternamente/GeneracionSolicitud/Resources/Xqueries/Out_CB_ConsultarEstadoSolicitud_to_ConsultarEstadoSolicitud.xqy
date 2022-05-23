xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/generacionsolicitud/consultarestadosolicitud/v1";
(:: import schema at "../WSDLs/BS_SBB_CB_GeneracionSolicitud.wsdl" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/generacionsolicitud/consultarestadosolicitud/v1";
(:: import schema at "../Schemas/EE_GS_ConsultarEstadoSolicitud.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarEstadoSolicitud) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarEstadoSolicitud) ::)) as element() (:: schema-element(ns2:salidaConsultarEstadoSolicitud) ::) {
    <ns2:salidaConsultarEstadoSolicitud>
        <ns2:NIR>{fn:data($payloadResponse/ns1:NIR)}</ns2:NIR>
        <ns2:idEtapa>{fn:data($payloadResponse/ns1:idEtapa)}</ns2:idEtapa>
        <ns2:nombreEtapa>{fn:data($payloadResponse/ns1:nombreEtapa)}</ns2:nombreEtapa>
        <ns2:idMotivo>{fn:data($payloadResponse/ns1:idMotivo)}</ns2:idMotivo>
        <ns2:descripcionMotivo>{fn:data($payloadResponse/ns1:descripcionMotivo)}</ns2:descripcionMotivo>
        <ns2:estado>{fn:data($payloadResponse/ns1:estado)}</ns2:estado>
        <ns2:fechaFin>{fn:data($payloadResponse/ns1:fechaFin)}</ns2:fechaFin>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaConsultarEstadoSolicitud>
};

local:func($payloadResponse)
