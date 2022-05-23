xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/consultarestadoliquidacion/v2";
(:: import schema at "../Schemas/EF_OF_ConsultarEstadoLiquidacion.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/consultarestadoliquidacion/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_ConsultarEstadoLiquidacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarEstadoLiquidacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarEstadoLiquidacion) ::)) as element() (:: schema-element(ns2:entradaConsultarEstadoLiquidacion) ::) {
    <ns2:entradaConsultarEstadoLiquidacion>
        <ns2:numeroReferencia>{fn:data($payloadRequest/ns1:numeroReferencia)}</ns2:numeroReferencia>
        <ns2:montoTransaccion>{fn:data($payloadRequest/ns1:montoTransaccion)}</ns2:montoTransaccion>
        
    </ns2:entradaConsultarEstadoLiquidacion>
};

local:func($payloadRequest)