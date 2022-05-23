xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/notificarpago/v2";
(:: import schema at "../Schemas/EF_OF_NotificarPago.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/np/operacionesfinancieras/notificarpago/v2";
(:: import schema at "../Schemas/Legacy/NP_OF_NotificarPago.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaNotificarPago) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaNotificarPago) ::)) as element() (:: schema-element(ns2:salidaNotificarPago) ::) {
    <ns2:salidaNotificarPago>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaNotificarPago>
};

local:func($payloadResponse)