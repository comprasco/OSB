xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/actualizardatossolicitante/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_ActualizarDatosSolicitante.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/actualizardatossolicitante/v2";
(:: import schema at "../Schemas/EF_OF_ActualizarDatosSolicitante.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaActualizarDatosSolicitante) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaActualizarDatosSolicitante) ::)) as element() (:: schema-element(ns2:entradaActualizarDatosSolicitante) ::) {
    <ns2:entradaActualizarDatosSolicitante>
        <ns2:numeroReferencia>{fn:data($payloadRequest/ns1:numeroReferencia)}</ns2:numeroReferencia>
        <ns2:tipoDocSolicitante>{fn:data($payloadRequest/ns1:tipoDocSolicitante)}</ns2:tipoDocSolicitante>
        <ns2:numeroDocSolicitante>{fn:data($payloadRequest/ns1:numeroDocSolicitante)}</ns2:numeroDocSolicitante>
        {
            if ($payloadRequest/ns1:primerNombreSolicitante)
            then <ns2:primerNombreSolicitante>{fn:data($payloadRequest/ns1:primerNombreSolicitante)}</ns2:primerNombreSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoNombreSolicitante)
            then <ns2:segundoNombreSolicitante>{fn:data($payloadRequest/ns1:segundoNombreSolicitante)}</ns2:segundoNombreSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerApellidoSolicitante)
            then <ns2:primerApellidoSolicitante>{fn:data($payloadRequest/ns1:primerApellidoSolicitante)}</ns2:primerApellidoSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoApellidoSolicitante)
            then <ns2:segundoApellidoSolicitante>{fn:data($payloadRequest/ns1:segundoApellidoSolicitante)}</ns2:segundoApellidoSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:razonSocial)
            then <ns2:razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</ns2:razonSocial>
            else ()
        }
        
    </ns2:entradaActualizarDatosSolicitante>
};

local:func($payloadRequest)