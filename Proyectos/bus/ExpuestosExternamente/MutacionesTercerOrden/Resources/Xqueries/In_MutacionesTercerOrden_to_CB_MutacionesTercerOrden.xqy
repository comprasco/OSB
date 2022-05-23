xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultaCambioTercerOrden.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesTercerOrden/consultaCambioTercerOrden/v1";
(:: import schema at "../Schemas/EE_CC_ConsultaCambioTercerOrden.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultaCambioTercerOrden) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultaCambioTercerOrden) ::)) as element() (:: schema-element(ns2:entradaConsultaCambioTercerOrden) ::) {
    <ns2:entradaConsultaCambioTercerOrden>
        {
            if ($payloadRequest/ns1:tipoIdentificacionPredio)
            then <ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns2:tipoIdentificacionPredio>
            else ()
        }
        {
            if ($payloadRequest/ns1:numIdentificacionPredio)
            then <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns2:numIdentificacionPredio>
            else ()
        }
    </ns2:entradaConsultaCambioTercerOrden>
};

local:func($payloadRequest)