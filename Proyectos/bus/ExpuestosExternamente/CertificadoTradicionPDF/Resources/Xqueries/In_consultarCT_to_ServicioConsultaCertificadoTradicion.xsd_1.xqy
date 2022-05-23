xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../../../CertificadoTradicion/Resources/Schemas/Legacy/ServicioConsultaCertificadoTradicion.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../../../CertificadoTradicion/Resources/Schemas/EE_CT_consultarCT.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::)) as element() (:: schema-element(ns2:ejecutar) ::) {
    <ns2:ejecutar/>
};

local:func($payloadRequest)