xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cn/mensajero/enviarmensaje/v1";
(:: import schema at "../Schemas/Legacy/CN_MB_EnviarMensaje.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaEnviarMensaje) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaEnviarMensaje) ::)) as element() (:: schema-element(ns1:salidaEnviarMensaje) ::) {
    <ns1:salidaEnviarMensaje>
        {
            if ($payloadResponse/ns1:fechaRecepcion)
            then <ns1:fechaRecepcion>{fn:data($payloadResponse/ns1:fechaRecepcion)}</ns1:fechaRecepcion>
            else ()
        }
        {
            if ($payloadResponse/ns1:identificadorGenerado)
            then <ns1:identificadorGenerado>{fn:data($payloadResponse/ns1:identificadorGenerado)}</ns1:identificadorGenerado>
            else ()
        }
        <ns1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns1:codMensaje>
        {
            if ($payloadResponse/ns1:codMensaje=200)
            then <ns1:descripcionMensaje>{'OK'}</ns1:descripcionMensaje>
            else (
            <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
            )
        }
        
    </ns1:salidaEnviarMensaje>
};

local:func($payloadResponse)
