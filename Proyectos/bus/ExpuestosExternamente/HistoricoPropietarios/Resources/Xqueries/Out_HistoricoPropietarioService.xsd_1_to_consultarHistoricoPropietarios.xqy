xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://historicopropietarios.snr.gov.co/";
(:: import schema at "../Schemas/Legacy/HistoricoPropietarioService.xsd_1.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropietarios/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropietarios.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:consultarHistoricoPropietarioResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:consultarHistoricoPropietarioResponse) ::)) as element() (:: schema-element(ns2:salidaConsultarHistoricoPropietarios) ::) {
    <ns2:salidaConsultarHistoricoPropietarios>
        {
            for $propietarios in $payloadResponse/return/propietarios
            return 
            <ns2:propietarios>
                {
                    for $historicoMatriculas in $propietarios/historicoMatriculas
                    return 
                    <ns2:historicoMatriculas>
                        {
                            if ($historicoMatriculas/anotacion)
                            then <ns2:numAnotacion>{fn:data($historicoMatriculas/anotacion)}</ns2:numAnotacion>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/circulo)
                            then <ns2:codCirculoRegistral>{fn:data($historicoMatriculas/circulo)}</ns2:codCirculoRegistral>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/fechaDesde)
                            then <ns2:fechaDesde>{fn:data($historicoMatriculas/fechaDesde)}</ns2:fechaDesde>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/fechaHasta)
                            then <ns2:fechaHasta>{fn:data($historicoMatriculas/fechaHasta)}</ns2:fechaHasta>
                            else ()
                        }
                        {
                            if ($historicoMatriculas/matricula)
                            then <ns2:numMatriculaInmobiliaria>{fn:data($historicoMatriculas/matricula)}</ns2:numMatriculaInmobiliaria>
                            else ()
                        }</ns2:historicoMatriculas>
                }
                {
                    if ($propietarios/tipoDocumento)
                    then <ns2:tipoDocumentoPersona>{fn:data($propietarios/tipoDocumento)}</ns2:tipoDocumentoPersona>
                    else ()
                }
                {
                    if ($propietarios/numeroDocumento)
                    then <ns2:numDocumentoPersona>{fn:data($propietarios/numeroDocumento)}</ns2:numDocumentoPersona>
                    else ()
                }
                {
                    if ($propietarios/primerApellido)
                    then <ns2:primerApellido>{fn:data($propietarios/primerApellido)}</ns2:primerApellido>
                    else ()
                }
                {
                    if ($propietarios/primerNombre)
                    then <ns2:primerNombre>{fn:data($propietarios/primerNombre)}</ns2:primerNombre>
                    else ()
                }
                {
                    if ($propietarios/segundoApellido)
                    then <ns2:segundoApellido>{fn:data($propietarios/segundoApellido)}</ns2:segundoApellido>
                    else ()
                }
                {
                    if ($propietarios/segundoNombre)
                    then <ns2:segundoNombre>{fn:data($propietarios/segundoNombre)}</ns2:segundoNombre>
                    else ()
                }
                {
                    if ($propietarios/razonSocial)
                    then <ns2:razonSocial>{fn:data($propietarios/razonSocial)}</ns2:razonSocial>
                    else ()
                }
            </ns2:propietarios>
        }
        {
            if ($payloadResponse/return/resultado/text()='OK')
            then <ns2:codMensaje>200</ns2:codMensaje>
            else (<ns2:codMensaje>409</ns2:codMensaje>)
        }
        
        {
            if ($payloadResponse/return/resultado/text()='OK')
            then <ns2:descripcionMensaje></ns2:descripcionMensaje>
            else (<ns2:descripcionMensaje>{fn:data($payloadResponse/return/resultado)}</ns2:descripcionMensaje>)
        }
    </ns2:salidaConsultarHistoricoPropietarios>
};

local:func($payloadResponse)
