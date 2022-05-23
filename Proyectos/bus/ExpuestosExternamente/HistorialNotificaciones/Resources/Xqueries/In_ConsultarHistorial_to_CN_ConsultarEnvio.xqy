xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cn/mensajero/consultarenvio/v1";
(:: import schema at "../../../Mensajero/Resources/Schemas/Legacy/CN_MB_ConsultarEnvio.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/historialNotificaciones/consultarHistorial/v1";
(:: import schema at "../Schemas/EE_HN_consultarHistorial.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistorial) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistorial) ::)) as element() (:: schema-element(ns2:entradaConsultarEnvio) ::) {
    <ns2:entradaConsultarEnvio>
        {
            if ($payloadRequest/ns1:fechaInicial)
            then <ns2:fechaInicial>{fn:data($payloadRequest/ns1:fechaInicial)}</ns2:fechaInicial>
            else ()
        }
        {
            if ($payloadRequest/ns1:fechaFinal)
            then <ns2:fechaFinal>{fn:data($payloadRequest/ns1:fechaFinal)}</ns2:fechaFinal>
            else ()
        }
        {
            if ($payloadRequest/ns1:tipoID)
            then <ns2:tipoID>{fn:data($payloadRequest/ns1:tipoID)}</ns2:tipoID>
            else ()
        }
        {
            if ($payloadRequest/ns1:identificador)
            then <ns2:identificador>{fn:data($payloadRequest/ns1:identificador)}</ns2:identificador>
            else ()
        }
        {
            if ($payloadRequest/ns1:pagina)
            then <ns2:pagina>{fn:data($payloadRequest/ns1:pagina)}</ns2:pagina>
            else ()
        }
        {
            if ($payloadRequest/ns1:direccionCorreoElectronicoDestinatario)
            then <ns2:direccionCorreoElectronicoDestinatario>{fn:data($payloadRequest/ns1:direccionCorreoElectronicoDestinatario)}</ns2:direccionCorreoElectronicoDestinatario>
            else ()
        }
        {
            if ($payloadRequest/ns1:numeroTelefonoDestinatario)
            then <ns2:numeroTelefonoDestinatario>{fn:data($payloadRequest/ns1:numeroTelefonoDestinatario)}</ns2:numeroTelefonoDestinatario>
            else ()
        }
    </ns2:entradaConsultarEnvio>
};

local:func($payloadRequest)
