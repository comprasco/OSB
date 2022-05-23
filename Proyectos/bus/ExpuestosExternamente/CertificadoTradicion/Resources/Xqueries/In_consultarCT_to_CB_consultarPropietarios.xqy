xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarPropietarios/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarPropietarios.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::)) as element() (:: schema-element(ns2:entradaDatosPropietario) ::) {
    <ns2:entradaDatosPropietario>
        <ns2:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns2:convenio>
        <ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns2:tipoIdentificacionPredio>
        <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns2:numIdentificacionPredio>
    </ns2:entradaDatosPropietario>
};

local:func($payloadRequest)
