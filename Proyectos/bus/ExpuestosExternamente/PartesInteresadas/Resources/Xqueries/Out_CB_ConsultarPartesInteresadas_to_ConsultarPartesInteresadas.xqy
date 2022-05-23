xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/partesinteresadas/consultarpartesinteresadas/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_ConsultarPartesInteresadas.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarPartesInteresadas) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarPartesInteresadas) ::)) as element() (:: schema-element(ns1:salidaConsultarPartesInteresadas) ::) {
    <ns1:salidaConsultarPartesInteresadas>
        {
            if ($payloadResponse/ns1:codDepartamento)
            then <ns1:codDepartamento>{fn:data($payloadResponse/ns1:codDepartamento)}</ns1:codDepartamento>
            else ()
        }
        {
            if ($payloadResponse/ns1:codMunicipio)
            then <ns1:codMunicipio>{fn:data($payloadResponse/ns1:codMunicipio)}</ns1:codMunicipio>
            else ()
        }
        {
            if ($payloadResponse/ns1:codCirculoRegistral)
            then <ns1:codCirculoRegistral>{fn:data($payloadResponse/ns1:codCirculoRegistral)}</ns1:codCirculoRegistral>
            else ()
        }
        {
            if ($payloadResponse/ns1:numMatriculaInmobiliaria)
            then <ns1:numMatriculaInmobiliaria>{fn:data($payloadResponse/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
            else ()
        }
        {
            if ($payloadResponse/ns1:interesados)
            then 
                <ns1:interesados>
                    {
                        for $interesado in $payloadResponse/ns1:interesados/ns1:interesado
                        return 
                        <ns1:interesado>
                            {
                                if ($interesado/ns1:tipoPersona)
                                then <ns1:tipoPersona>{fn:data($interesado/ns1:tipoPersona)}</ns1:tipoPersona>
                                else ()
                            }
                            {
                                if ($interesado/ns1:tipoDocumentoPersona)
                                then <ns1:tipoDocumentoPersona>{fn:data($interesado/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                else ()
                            }
                            {
                                if ($interesado/ns1:numDocumentoPersona)
                                then <ns1:numDocumentoPersona>{fn:data($interesado/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                else ()
                            }
                            {
                                if ($interesado/ns1:primerNombre)
                                then <ns1:primerNombre>{fn:data($interesado/ns1:primerNombre)}</ns1:primerNombre>
                                else ()
                            }
                            {
                                if ($interesado/ns1:segundoNombre)
                                then <ns1:segundoNombre>{fn:data($interesado/ns1:segundoNombre)}</ns1:segundoNombre>
                                else ()
                            }
                            {
                                if ($interesado/ns1:primerApellido)
                                then <ns1:primerApellido>{fn:data($interesado/ns1:primerApellido)}</ns1:primerApellido>
                                else ()
                            }
                            {
                                if ($interesado/ns1:segundoApellido)
                                then <ns1:segundoApellido>{fn:data($interesado/ns1:segundoApellido)}</ns1:segundoApellido>
                                else ()
                            }
                            {
                                if ($interesado/ns1:razonSocial)
                                then <ns1:razonSocial>{fn:data($interesado/ns1:razonSocial)}</ns1:razonSocial>
                                else ()
                            }
                            {
                                if ($interesado/ns1:tipoParteInteresada)
                                then <ns1:tipoParteInteresada>{fn:data($interesado/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                else ()
                            }
                        </ns1:interesado>
                    }
                </ns1:interesados>
            else ()
        }
        <ns1:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns1:codigoMensaje>
        {
            if ($payloadResponse/ns1:codigoMensaje=200)
            then <ns1:descripcionMensaje>{'OK'}</ns1:descripcionMensaje>
            else (
            <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
            )
        }
    </ns1:salidaConsultarPartesInteresadas>
};

local:func($payloadResponse)
