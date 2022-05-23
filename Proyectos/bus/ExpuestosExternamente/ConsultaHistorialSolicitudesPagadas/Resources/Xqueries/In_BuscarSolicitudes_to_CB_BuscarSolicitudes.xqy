xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/consultahistorialsolicitudespagadas/buscarsolicitudes/v1";
(:: import schema at "../Schemas/Legacy/CB_CHSP_BuscarSolicitudes.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultahistorialsolicitudespagadas/buscarsolicitudes/v1";
(:: import schema at "../Schemas/EE_CHSP_BuscarSolicitudes.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaBuscarSolicitudes) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaBuscarSolicitudes) ::)) as element() (:: schema-element(ns2:entradaBuscarSolicitudes) ::) {
    <ns2:entradaBuscarSolicitudes>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:solicitante>
            <ns2:tipoDocumento>{fn:data($payloadRequest/ns1:listaSolicitante/ns1:solicitante/ns1:tipoDocumento)}</ns2:tipoDocumento>
            <ns2:numeroDocumento>{fn:data($payloadRequest/ns1:listaSolicitante/ns1:solicitante/ns1:numeroDocumento)}</ns2:numeroDocumento>
            <ns2:tipoPersona>{fn:data($payloadRequest/ns1:listaSolicitante/ns1:solicitante/ns1:tipoPersona)}</ns2:tipoPersona></ns2:solicitante>
        <ns2:servicio>{fn:data($payloadRequest/ns1:servicio)}</ns2:servicio>
        {
            if ($payloadRequest/ns1:nir)
            then <ns2:nir>{fn:data($payloadRequest/ns1:nir)}</ns2:nir>
            else ()
        }
        <ns2:fechaDesdeBusqueda>{fn:data($payloadRequest/ns1:fechaDesdeBusqueda)}</ns2:fechaDesdeBusqueda>
        {
            if ($payloadRequest/ns1:fechaHastaBusqueda)
            then <ns2:fechaHastaBusqueda>{fn:data($payloadRequest/ns1:fechaHastaBusqueda)}</ns2:fechaHastaBusqueda>
            else ()
        }
        
    </ns2:entradaBuscarSolicitudes>
};

local:func($payloadRequest)