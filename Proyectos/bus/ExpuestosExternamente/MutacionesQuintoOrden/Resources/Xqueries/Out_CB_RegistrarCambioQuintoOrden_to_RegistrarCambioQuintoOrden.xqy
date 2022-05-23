xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/mutacionesQuintoOrden/registrarCambioQuintoOrden/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_RegistrarCambioQuintoOrden.xsd" ::)
declare namespace v1="https://www.supernotariado.gov.co/schemas/bachue/ee/mutacionesQuintoOrden/registrarCambioQuintoOrden/v1";
(:: import schema at "../Schemas/EE_CC_RegistrarCambioQuintoOrden.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaRegistrarCambioQuintoOrden) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaRegistrarCambioQuintoOrden) ::)) as element() (:: schema-element(v1:salidaRegistrarCambioQuintoOrden) ::) {
    <v1:salidaRegistrarCambioQuintoOrden>
        <v1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</v1:codMensaje>
        {
            if ($payloadResponse/ns1:codMensaje=200)
            then <v1:descripcionMensaje>{'OK'}</v1:descripcionMensaje>
            else (
            <v1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</v1:descripcionMensaje>
            )
        }
         
         
        
        
    </v1:salidaRegistrarCambioQuintoOrden>
};

local:func($payloadResponse)
