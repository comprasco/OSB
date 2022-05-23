xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/consultahistorialsolicitudespagadas/consultardetallesolicitud/v1";
(:: import schema at "../Schemas/Legacy/CB_CHSP_ConsultarDetalleSolicitud.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultahistorialsolicitudespagadas/consultardetallesolicitud/v1";
(:: import schema at "../Schemas/EE_CHSP_ConsultarDetalleSolicitud.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarDetalleSolicitud) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarDetalleSolicitud) ::)) as element() (:: schema-element(ns2:entradaConsultarDetalleSolicitud) ::) {
    <ns2:entradaConsultarDetalleSolicitud>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:solicitante>
            <ns2:tipoDocumento>{fn:data($payloadRequest/ns1:solicitante/ns1:tipoDocumento)}</ns2:tipoDocumento>
            <ns2:numeroDocumento>{fn:data($payloadRequest/ns1:solicitante/ns1:numeroDocumento)}</ns2:numeroDocumento>
            <ns2:tipoPersona>{fn:data($payloadRequest/ns1:solicitante/ns1:tipoPersona)}</ns2:tipoPersona></ns2:solicitante>
        <ns2:nir>{fn:data($payloadRequest/ns1:nir)}</ns2:nir>
    </ns2:entradaConsultarDetalleSolicitud>
};

local:func($payloadRequest)