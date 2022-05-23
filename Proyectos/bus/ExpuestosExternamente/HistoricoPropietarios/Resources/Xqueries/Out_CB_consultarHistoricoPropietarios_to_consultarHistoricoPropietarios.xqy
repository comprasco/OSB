xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropietarios/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropietarios.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarHistoricoPropietarios) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarHistoricoPropietarios) ::)) as element() (:: schema-element(ns1:salidaConsultarHistoricoPropietarios) ::) {
    <ns1:salidaConsultarHistoricoPropietarios>
        {
            for $propietarios in $payloadResponse/ns1:propietarios
            return 
            <ns1:propietarios>
                {
                    for $historicoMatriculas in $propietarios/ns1:historicoMatriculas
                    return 
                    <ns1:historicoMatriculas>
                        {
                            if ($historicoMatriculas/ns1:numAnotacion)
                            then <ns1:numAnotacion>{fn:data($historicoMatriculas/ns1:numAnotacion)}</ns1:numAnotacion>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/ns1:codCirculoRegistral)
                            then <ns1:codCirculoRegistral>{fn:data($historicoMatriculas/ns1:codCirculoRegistral)}</ns1:codCirculoRegistral>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/ns1:porcentajeParticipacion)
                            then <ns1:porcentajeParticipacion>{fn:data($historicoMatriculas/ns1:porcentajeParticipacion)}</ns1:porcentajeParticipacion>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/ns1:fechaDesde)
                            then <ns1:fechaDesde>{fn:data($historicoMatriculas/ns1:fechaDesde)}</ns1:fechaDesde>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/ns1:fechaHasta)
                            then <ns1:fechaHasta>{fn:data($historicoMatriculas/ns1:fechaHasta)}</ns1:fechaHasta>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/ns1:numMatriculaInmobiliaria)
                            then <ns1:numMatriculaInmobiliaria>{fn:data($historicoMatriculas/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/ns1:NUPRE)
                            then <ns1:NUPRE>{fn:data($historicoMatriculas/ns1:NUPRE)}</ns1:NUPRE>
                            else ()
                        }
                    </ns1:historicoMatriculas>
                }
                {
                    if ($propietarios/ns1:tipoDocumentoPersona)
                    then <ns1:tipoDocumentoPersona>{fn:data($propietarios/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                    else ()
                }
                {
                    if ($propietarios/ns1:numDocumentoPersona)
                    then <ns1:numDocumentoPersona>{fn:data($propietarios/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                    else ()
                }
                {
                    if ($propietarios/ns1:numNIT)
                    then <ns1:numNIT>{fn:data($propietarios/ns1:numNIT)}</ns1:numNIT>
                    else ()
                }
                {
                    if ($propietarios/ns1:primerApellido)
                    then <ns1:primerApellido>{fn:data($propietarios/ns1:primerApellido)}</ns1:primerApellido>
                    else ()
                }
                {
                    if ($propietarios/ns1:primerNombre)
                    then <ns1:primerNombre>{fn:data($propietarios/ns1:primerNombre)}</ns1:primerNombre>
                    else ()
                }
                {
                    if ($propietarios/ns1:segundoApellido)
                    then <ns1:segundoApellido>{fn:data($propietarios/ns1:segundoApellido)}</ns1:segundoApellido>
                    else ()
                }
                {
                    if ($propietarios/ns1:segundoNombre)
                    then <ns1:segundoNombre>{fn:data($propietarios/ns1:segundoNombre)}</ns1:segundoNombre>
                    else ()
                }
                {
                    if ($propietarios/ns1:razonSocial)
                    then <ns1:razonSocial>{fn:data($propietarios/ns1:razonSocial)}</ns1:razonSocial>
                    else ()
                }
            </ns1:propietarios>
        }
        {
            if ($payloadResponse/ns1:codMensaje)
            then <ns1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns1:codMensaje>
            else ()
        }
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
            else ()
        }
    </ns1:salidaConsultarHistoricoPropietarios>
};

local:func($payloadResponse)
