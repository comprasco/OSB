xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultahistorialsolicitudespagadas/buscarsolicitudes/v1";
(:: import schema at "../Schemas/Legacy/CB_CHSP_BuscarSolicitudes.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/consultahistorialsolicitudespagadas/buscarsolicitudes/v1";
(:: import schema at "../Schemas/EE_CHSP_BuscarSolicitudes.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaBuscarSolicitudes) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaBuscarSolicitudes) ::)) as element() (:: schema-element(ns2:salidaBuscarSolicitudes) ::) {
    <ns2:salidaBuscarSolicitudes>
        
        <ns2:solicitudes>
            {
                for $solicitud in $payloadResponse/*:solicitudes/ns1:solicitud
                return 
                <ns2:solicitud>
                    <ns2:nir>{fn:data($solicitud/ns1:nir)}</ns2:nir>
                    <ns2:descripcionServicio>{fn:data($solicitud/*:descripcionServicio)}</ns2:descripcionServicio>
                    <ns2:descripcionSubServicio>{fn:data($solicitud/*:descripcionSubServicio)}</ns2:descripcionSubServicio>
                    <ns2:fechaServicio>{fn:data($solicitud/*:fechaServicio)}</ns2:fechaServicio></ns2:solicitud>
            }
        </ns2:solicitudes>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaBuscarSolicitudes>
};

local:func($payloadResponse)