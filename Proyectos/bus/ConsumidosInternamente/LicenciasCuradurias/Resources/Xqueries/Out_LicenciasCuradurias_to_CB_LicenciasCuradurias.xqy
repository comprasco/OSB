xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/licenciasCuradurias/consultarLicenciasPorMatricula/v1";
(:: import schema at "../Schemas/Legacy/CB_CC_ConsultarLicenciasPorMatricula.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ci/licenciasCuradurias/consultarLicenciasPorMatricula/v1";
(:: import schema at "../Schemas/Legacy/CI_CC_ConsultarLicenciasPorMatricula.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarLicenciasPorMatricula) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarLicenciasPorMatricula) ::)) as element() (:: schema-element(ns2:salidaConsultarLicenciasPorMatricula) ::) {
    <ns2:salidaConsultarLicenciasPorMatricula>
        <ns2:estado>{fn:data($payloadResponse/ns1:estado)}</ns2:estado>
        <ns2:licencia>
            <ns2:numMatriculaInmobiliaria>{fn:data($payloadResponse/ns1:licencia/ns1:matricula)}</ns2:numMatriculaInmobiliaria>
            <ns2:numeroLicencia>{fn:data($payloadResponse/ns1:licencia/ns1:numero_licencia)}</ns2:numeroLicencia>
            <ns2:numeroRadicacion>{fn:data($payloadResponse/ns1:licencia/ns1:numero_radicacion)}</ns2:numeroRadicacion>
            <ns2:fechaRadicacion>{fn:data($payloadResponse/ns1:licencia/ns1:fecha_radicacion)}</ns2:fechaRadicacion>
            {
                if ($payloadResponse/ns1:licencia/ns1:observacion)
                then <ns2:observacion>{fn:data($payloadResponse/ns1:licencia/ns1:observacion)}</ns2:observacion>
                else ()
            }
            <ns2:documento>{fn:data($payloadResponse/ns1:licencia/ns1:documento)}</ns2:documento>
            <ns2:vigencia>{fn:data($payloadResponse/ns1:licencia/ns1:vigencia)}</ns2:vigencia>
            <ns2:tipoAutorizacion>{fn:data($payloadResponse/ns1:licencia/ns1:tipo_autorizacion)}</ns2:tipoAutorizacion>
            <ns2:fechaEjecutoria>{fn:data($payloadResponse/ns1:licencia/ns1:fecha_ejecutoria)}</ns2:fechaEjecutoria></ns2:licencia>
            {
                if (count($payloadResponse/ns1:licencia)!= 0)
                then <ns2:codigoMensaje>200</ns2:codigoMensaje>
                else ()
            }
            {
                if (count($payloadResponse/ns1:licencia)!= 0)
                then <ns2:descripcionMensaje>OK</ns2:descripcionMensaje>
                else ()
            }        
        
        
    </ns2:salidaConsultarLicenciasPorMatricula>
};

local:func($payloadResponse)