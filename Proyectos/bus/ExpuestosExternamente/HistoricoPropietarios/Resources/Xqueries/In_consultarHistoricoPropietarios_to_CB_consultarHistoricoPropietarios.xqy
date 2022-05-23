xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropietarios/v1";
(:: import schema at "../Schemas/Legacy/CB_HP_consultarHistoricoPropietarios.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistoricoPropietarios) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistoricoPropietarios) ::)) as element() (:: schema-element(ns1:entradaConsultarHistoricoPropietarios) ::) {
    <ns1:entradaConsultarHistoricoPropietarios>
        {
            if ($payloadRequest/ns1:tipoIdentificacionPredio)
            then <ns1:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns1:tipoIdentificacionPredio>
            else ()
        }
        {
            if ($payloadRequest/ns1:numIdentificacionPredio)
            then <ns1:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns1:numIdentificacionPredio>
            else ()
        }
        {
            if ($payloadRequest/ns1:convenio)
            then <ns1:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns1:convenio>
            else ()
        }
    </ns1:entradaConsultarHistoricoPropietarios>
};

local:func($payloadRequest)
