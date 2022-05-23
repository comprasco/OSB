xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://ws.ani.rnec.gov.co/";
(:: import schema at "../Schemas/Legacy/WSConsultas.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ce/consulta_ANI_RNEC/consultarCedulas/v1";
(:: import schema at "../Schemas/CE_CAR_ConsultarCedulas.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarCedulas) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarCedulas) ::)) as element() (:: schema-element(ns2:consultarCedulas) ::) {
    <ns2:consultarCedulas>
        <nuip>{fn:data($payloadRequest/ns1:nuip)}</nuip>
    </ns2:consultarCedulas>
};

local:func($payloadRequest)
