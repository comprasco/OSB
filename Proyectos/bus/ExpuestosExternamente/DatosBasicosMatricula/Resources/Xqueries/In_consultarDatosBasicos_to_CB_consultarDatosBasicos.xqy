xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosBasicos/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDatosBasicos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:entradaDatosBasicos) ::) {
    <ns2:entradaDatosBasicos>
        <ns2:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns2:convenio>
        <ns2:codDepartamento>{fn:data($payloadRequest/ns1:codDepartamento)}</ns2:codDepartamento>
        <ns2:codMunicipio>{fn:data($payloadRequest/ns1:codMunicipio)}</ns2:codMunicipio>
        <ns2:criterioBusqueda>{fn:data($payloadRequest/ns1:criterioBusqueda)}</ns2:criterioBusqueda>
        <ns2:valorCriterioBusqueda>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</ns2:valorCriterioBusqueda>
    </ns2:entradaDatosBasicos>
};

local:func($payloadRequest)