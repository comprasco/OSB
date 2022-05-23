xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/cambioPropietario/consultarCambioPropietario/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_ConsultarCambioPropietario.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarCambioPropietario) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarCambioPropietario) ::)) as element() (:: schema-element(ns1:salidaConsultarCambioPropietario) ::) {
    <ns1:salidaConsultarCambioPropietario>
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
            if ($payloadResponse/ns1:anotacionesPredio)
            then 
                <ns1:anotacionesPredio>
                    {
                        for $anotacionPredio in $payloadResponse/ns1:anotacionesPredio/ns1:anotacionPredio
                        return 
                        <ns1:anotacionPredio>
                            {
                                if ($anotacionPredio/ns1:comentario)
                                then <ns1:comentario>{fn:data($anotacionPredio/ns1:comentario)}</ns1:comentario>
                                else ()
                            }
                            {
                                if ($anotacionPredio/ns1:fechaAnotacion)
                                then <ns1:fechaAnotacion>{fn:data($anotacionPredio/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                else ()
                            }
                            {
                                if ($anotacionPredio/ns1:valorActo)
                                then <ns1:valorActo>{fn:data($anotacionPredio/ns1:valorActo)}</ns1:valorActo>
                                else ()
                            }
                            {
                                if ($anotacionPredio/ns1:codNaturalezaJuridicaFolio)
                                then <ns1:codNaturalezaJuridicaFolio>{fn:data($anotacionPredio/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                else ()
                            }
                            {
                                if ($anotacionPredio/ns1:propietarios)
                                then 
                                    <ns1:propietarios>
                                        {
                                            for $propietario in $anotacionPredio/ns1:propietarios/ns1:propietario
                                            return 
                                            <ns1:propietario>
                                                {
                                                    if ($propietario/ns1:tipoPersona)
                                                    then <ns1:tipoPersona>{fn:data($propietario/ns1:tipoPersona)}</ns1:tipoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($propietario/ns1:tipoDocumentoPersona)
                                                    then <ns1:tipoDocumentoPersona>{fn:data($propietario/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($propietario/ns1:numDocumentoPersona)
                                                    then <ns1:numDocumentoPersona>{fn:data($propietario/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                    else ()
                                                }
                                                {
                                                    if ($propietario/ns1:DRR)
                                                    then <ns1:DRR>{fn:data($propietario/ns1:DRR)}</ns1:DRR>
                                                    else ()
                                                }
                                                {
                                                    if ($propietario/ns1:porcentajeParticipacion)
                                                    then <ns1:porcentajeParticipacion>{fn:data($propietario/ns1:porcentajeParticipacion)}</ns1:porcentajeParticipacion>
                                                    else ()
                                                }
                                            </ns1:propietario>
                                        }
                                    </ns1:propietarios>
                                else ()
                            }
                        </ns1:anotacionPredio>
                    }
                </ns1:anotacionesPredio>
            else ()
        }
        <ns1:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns1:codMensaje>
        {
            if ($payloadResponse/ns1:codMensaje=200)
            then <ns1:descripcionMensaje>{'OK'}</ns1:descripcionMensaje>
            else (
            <ns1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns1:descripcionMensaje>
            )
        }
    </ns1:salidaConsultarCambioPropietario>
};

local:func($payloadResponse)
