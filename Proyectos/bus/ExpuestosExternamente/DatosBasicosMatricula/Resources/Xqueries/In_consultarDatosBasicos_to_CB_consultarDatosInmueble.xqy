xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosImueble/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDatosInmueble.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:entradaDatosInmueble) ::) {
    <ns2:entradaDatosInmueble>
        <ns2:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns2:convenio>
        <ns2:tipoIdentificacionPredio></ns2:tipoIdentificacionPredio>
        <ns2:numIdentificacionPredio></ns2:numIdentificacionPredio>
    </ns2:entradaDatosInmueble>
};

local:func($payloadRequest)