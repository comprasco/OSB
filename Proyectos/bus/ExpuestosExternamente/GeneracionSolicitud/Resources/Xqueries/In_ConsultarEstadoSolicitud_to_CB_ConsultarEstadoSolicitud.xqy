xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/generacionsolicitud/consultarestadosolicitud/v1";
(:: import schema at "../WSDLs/BS_SBB_CB_GeneracionSolicitud.wsdl" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/generacionsolicitud/consultarestadosolicitud/v1";
(:: import schema at "../Schemas/EE_GS_ConsultarEstadoSolicitud.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarEstadoSolicitud) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarEstadoSolicitud) ::)) as element() (:: schema-element(ns2:entradaConsultarEstadoSolicitud) ::) {
    <ns2:entradaConsultarEstadoSolicitud>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:solicitante>
            <ns2:tipoDocumento>{fn:data($payloadRequest/ns1:solicitante/ns1:tipoDocumento)}</ns2:tipoDocumento>
            <ns2:numeroDocumento>{fn:data($payloadRequest/ns1:solicitante/ns1:numeroDocumento)}</ns2:numeroDocumento>
            <ns2:tipoPersona>{fn:data($payloadRequest/ns1:solicitante/ns1:tipoPersona)}</ns2:tipoPersona></ns2:solicitante>
        <ns2:NIR>{fn:data($payloadRequest/ns1:NIR)}</ns2:NIR>
    </ns2:entradaConsultarEstadoSolicitud>
};

local:func($payloadRequest)
