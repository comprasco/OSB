xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/generacionsolicitud/generarsolicitud/v1";
(:: import schema at "../WSDLs/BS_SBB_CB_GeneracionSolicitud.wsdl" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/generacionsolicitud/generarsolicitud/v1";
(:: import schema at "../Schemas/EE_GS_GenerarSolicitud.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaGenerarSolicitud) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaGenerarSolicitud) ::)) as element() (:: schema-element(ns2:salidaGenerarSolicitud) ::) {
    <ns2:salidaGenerarSolicitud>
        <ns2:NIR>{fn:data($payloadResponse/ns1:NIR)}</ns2:NIR>
        <ns2:codigoEstadoSolicitud>{fn:data($payloadResponse/ns1:codigoEstadoSolicitud)}</ns2:codigoEstadoSolicitud>
        <ns2:descripcionEstadoSolicitud>{fn:data($payloadResponse/ns1:descripcionEstadoSolicitud)}</ns2:descripcionEstadoSolicitud>
        <ns2:mensajeAlSolicitante>{fn:data($payloadResponse/ns1:mensajeAlSolicitante)}</ns2:mensajeAlSolicitante>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaGenerarSolicitud>
};

local:func($payloadResponse)
