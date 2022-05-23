xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/consultamigracion/consultarMigracionPredio/v1";
(:: import schema at "../../../ConsultaMigracion/Resources/Schemas/Legacy/CB_CM_consultarMigracionPredio.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::)) as element() (:: schema-element(ns2:entradaConsultaMigracionPredio) ::) {
    <ns2:entradaConsultaMigracionPredio>
        <ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns2:tipoIdentificacionPredio>
        <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns2:numIdentificacionPredio>
    </ns2:entradaConsultaMigracionPredio>
};

local:func($payloadRequest)
