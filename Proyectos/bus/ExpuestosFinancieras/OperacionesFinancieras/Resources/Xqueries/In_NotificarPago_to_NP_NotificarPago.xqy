xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/notificarpago/v2";
(:: import schema at "../Schemas/EF_OF_NotificarPago.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/notificarpago/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_NotificarPago.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaNotificarPago) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaNotificarPago) ::)) as element() (:: schema-element(ns2:entradaNotificarPago) ::) {
    <ns2:entradaNotificarPago>
        <ns2:codigoEntidadRecaudadora>{fn:data($payloadRequest/ns1:codigoEntidadRecaudadora)}</ns2:codigoEntidadRecaudadora>
        <ns2:codigoPuntoRecaudoEntidad>{fn:data($payloadRequest/ns1:codigoPuntoRecaudoEntidad)}</ns2:codigoPuntoRecaudoEntidad>
        <ns2:codigoTipoRecaudo>{fn:data($payloadRequest/ns1:codigoTipoRecaudo)}</ns2:codigoTipoRecaudo>
        <ns2:fechaTransaccion>{fn:data($payloadRequest/ns1:fechaTransaccion)}</ns2:fechaTransaccion>
        <ns2:fechaBancaria>{fn:data($payloadRequest/ns1:fechaBancaria)}</ns2:fechaBancaria>
        <ns2:codigoTransaccionRecaudador>{fn:data($payloadRequest/ns1:codigoTransaccionRecaudador)}</ns2:codigoTransaccionRecaudador>
        <ns2:montoTransaccion>{fn:data($payloadRequest/ns1:montoTransaccion)}</ns2:montoTransaccion>
        <ns2:numeroReferenciaBachue>{fn:data($payloadRequest/ns1:numeroReferenciaBachue)}</ns2:numeroReferenciaBachue>
       
    </ns2:entradaNotificarPago>
};

local:func($payloadRequest)