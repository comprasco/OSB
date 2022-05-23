xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/actualizardatossolicitante/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_ActualizarDatosSolicitante.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/actualizardatossolicitante/v2";
(:: import schema at "../Schemas/EF_OF_ActualizarDatosSolicitante.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaActualizarDatosSolicitante) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaActualizarDatosSolicitante) ::)) as element() (:: schema-element(ns2:salidaActualizarDatosSolicitante) ::) {
    <ns2:salidaActualizarDatosSolicitante>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaActualizarDatosSolicitante>
};

local:func($payloadResponse)