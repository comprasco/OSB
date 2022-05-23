xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/validaractualizaciondatossolicitante/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_ValidarActualizacionDatosSolicitante.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/notificarpago/v2";
(:: import schema at "../Schemas/EF_OF_NotificarPago.xsd" ::)

declare variable $PayloadRequest as element() (:: schema-element(ns1:entradaNotificarPago) ::) external;

declare function local:func($PayloadRequest as element() (:: schema-element(ns1:entradaNotificarPago) ::)) as element() (:: schema-element(ns2:entradaValidarActualizacionDatosSolicitante) ::) {
    <ns2:entradaValidarActualizacionDatosSolicitante>
        <ns2:numeroReferencia>{fn:data($PayloadRequest/ns1:numeroReferenciaBachue)}</ns2:numeroReferencia>
       
    </ns2:entradaValidarActualizacionDatosSolicitante>
};

local:func($PayloadRequest)