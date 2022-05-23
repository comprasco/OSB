xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultahistorialsolicitudespagadas/consultardetallesolicitud/v1";
(:: import schema at "../Schemas/Legacy/CB_CHSP_ConsultarDetalleSolicitud.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/consultahistorialsolicitudespagadas/consultardetallesolicitud/v1";
(:: import schema at "../Schemas/EE_CHSP_ConsultarDetalleSolicitud.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarDetalleSolicitud) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarDetalleSolicitud) ::)) as element() (:: schema-element(ns2:salidaConsultarDetalleSolicitud) ::) {
    <ns2:salidaConsultarDetalleSolicitud>
        
        <ns2:turnos>
            {
                for $turno in $payloadResponse/*:turnos/ns1:turno
                return 
                <ns2:turno>
                    <ns2:nir>{fn:data($turno/*:nir)}</ns2:nir>
                    <ns2:turno>{fn:data($turno/*:turno)}</ns2:turno>
                    <ns2:descripcionServicio>{fn:data($turno/*:descripcionServicio)}</ns2:descripcionServicio>
                    <ns2:descricionSubServicio>{fn:data($turno/*:descricionSubServicio)}</ns2:descricionSubServicio>
                    <ns2:fechaServicio>{fn:data($turno/*:fechaServicio)}</ns2:fechaServicio></ns2:turno>
            }
        </ns2:turnos>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaConsultarDetalleSolicitud>
};

local:func($payloadResponse)