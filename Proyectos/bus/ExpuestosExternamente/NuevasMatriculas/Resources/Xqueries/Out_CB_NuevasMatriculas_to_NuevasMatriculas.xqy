xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/nuevasMatriculas/consultarNuevasMatriculas/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_ConsultarNuevasMatriculas.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultarNuevasMatriculas) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultarNuevasMatriculas) ::)) as element() (:: schema-element(ns1:salidaConsultarNuevasMatriculas) ::) {
    <ns1:salidaConsultarNuevasMatriculas>
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
            if ($payloadResponse/ns1:nuevasMatriculas)
            then 
                <ns1:nuevasMatriculas>
                    {
                        for $nuevaMatricula in $payloadResponse/ns1:nuevasMatriculas/ns1:nuevaMatricula
                        return 
                        <ns1:nuevaMatricula>
                            {
                                if ($nuevaMatricula/ns1:anotacionPredio)
                                then 
                                    <ns1:anotacionPredio>
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:numMatriculaInmobiliaria)
                                            then <ns1:numMatriculaInmobiliaria>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:codNaturalezaJuridicaFolio)
                                            then <ns1:codNaturalezaJuridicaFolio>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:nomNaturalezaJuridicaFolio)
                                            then <ns1:nomNaturalezaJuridicaFolio>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:NUPRE)
                                            then <ns1:NUPRE>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:NUPRE)}</ns1:NUPRE>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:comentario)
                                            then <ns1:comentario>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:comentario)}</ns1:comentario>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:fechaAnotacion)
                                            then <ns1:fechaAnotacion>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:DRR)
                                            then <ns1:DRR>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:DRR)}</ns1:DRR>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:codigoRegistralDerecho)
                                            then <ns1:codigoRegistralDerecho>{fn:data($nuevaMatricula/ns1:anotacionPredio/ns1:codigoRegistralDerecho)}</ns1:codigoRegistralDerecho>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:propietarios)
                                            then 
                                                <ns1:propietarios>
                                                    {
                                                        for $propietario in $nuevaMatricula/ns1:anotacionPredio/ns1:propietarios/ns1:propietario
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
                                                                if ($propietario/ns1:porcentajeParticipacion)
                                                                then <ns1:porcentajeParticipacion>{fn:data($propietario/ns1:porcentajeParticipacion)}</ns1:porcentajeParticipacion>
                                                                else ()
                                                            }
                                                        </ns1:propietario>
                                                    }
                                                </ns1:propietarios>
                                            else ()
                                        }
                                        {
                                            if ($nuevaMatricula/ns1:anotacionPredio/ns1:fuentesAdministrativas)
                                            then 
                                                <ns1:fuentesAdministrativas>
                                                    {
                                                        for $fuenteAdministrativa in $nuevaMatricula/ns1:anotacionPredio/ns1:fuentesAdministrativas/ns1:fuenteAdministrativa
                                                        return 
                                                        <ns1:fuenteAdministrativa>
                                                            {
                                                                if ($fuenteAdministrativa/ns1:numDocumentoPublico)
                                                                then <ns1:numDocumentoPublico>{fn:data($fuenteAdministrativa/ns1:numDocumentoPublico)}</ns1:numDocumentoPublico>
                                                                else ()
                                                            }
                                                            {
                                                                if ($fuenteAdministrativa/ns1:tipoDocumentoPublico)
                                                                then <ns1:tipoDocumentoPublico>{fn:data($fuenteAdministrativa/ns1:tipoDocumentoPublico)}</ns1:tipoDocumentoPublico>
                                                                else ()
                                                            }
                                                            {
                                                                if ($fuenteAdministrativa/ns1:fechaDocumento)
                                                                then <ns1:fechaDocumento>{fn:data($fuenteAdministrativa/ns1:fechaDocumento)}</ns1:fechaDocumento>
                                                                else ()
                                                            }
                                                        </ns1:fuenteAdministrativa>
                                                    }
                                                </ns1:fuentesAdministrativas>
                                            else ()
                                        }
                                    </ns1:anotacionPredio>
                                else ()
                            }
                            {
                                if ($nuevaMatricula/ns1:listaPublicidades)
                                then 
                                    <ns1:listaPublicidades>
                                        {
                                            for $publicidad in $nuevaMatricula/ns1:listaPublicidades/ns1:publicidad
                                            return 
                                            <ns1:publicidad>
                                                {
                                                    if ($publicidad/ns1:numAnotacion)
                                                    then <ns1:numAnotacion>{fn:data($publicidad/ns1:numAnotacion)}</ns1:numAnotacion>
                                                    else ()
                                                }
                                                {
                                                    if ($publicidad/ns1:comentario)
                                                    then <ns1:comentario>{fn:data($publicidad/ns1:comentario)}</ns1:comentario>
                                                    else ()
                                                }
                                                {
                                                    if ($publicidad/ns1:fechaAnotacion)
                                                    then <ns1:fechaAnotacion>{fn:data($publicidad/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                                    else ()
                                                }
                                                {
                                                    if ($publicidad/ns1:codNaturalezaJuridicaFolio)
                                                    then <ns1:codNaturalezaJuridicaFolio>{fn:data($publicidad/ns1:codNaturalezaJuridicaFolio)}</ns1:codNaturalezaJuridicaFolio>
                                                    else ()
                                                }
                                                {
                                                    if ($publicidad/ns1:nomNaturalezaJuridicaFolio)
                                                    then <ns1:nomNaturalezaJuridicaFolio>{fn:data($publicidad/ns1:nomNaturalezaJuridicaFolio)}</ns1:nomNaturalezaJuridicaFolio>
                                                    else ()
                                                }
                                                {
                                                    if ($publicidad/ns1:dominioDRR)
                                                    then <ns1:dominioDRR>{fn:data($publicidad/ns1:dominioDRR)}</ns1:dominioDRR>
                                                    else ()
                                                }
                                                {
                                                    if ($publicidad/ns1:intervinientes)
                                                    then 
                                                        <ns1:intervinientes>
                                                            {
                                                                for $interviniente in $publicidad/ns1:intervinientes/ns1:interviniente
                                                                return 
                                                                <ns1:interviniente>
                                                                    {
                                                                        if ($interviniente/ns1:tipoDocumentoPersona)
                                                                        then <ns1:tipoDocumentoPersona>{fn:data($interviniente/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:numDocumentoPersona)
                                                                        then <ns1:numDocumentoPersona>{fn:data($interviniente/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:primerNombre)
                                                                        then <ns1:primerNombre>{fn:data($interviniente/ns1:primerNombre)}</ns1:primerNombre>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:segundoNombre)
                                                                        then <ns1:segundoNombre>{fn:data($interviniente/ns1:segundoNombre)}</ns1:segundoNombre>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:primerApellido)
                                                                        then <ns1:primerApellido>{fn:data($interviniente/ns1:primerApellido)}</ns1:primerApellido>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:segundoApellido)
                                                                        then <ns1:segundoApellido>{fn:data($interviniente/ns1:segundoApellido)}</ns1:segundoApellido>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:razonSocial)
                                                                        then <ns1:razonSocial>{fn:data($interviniente/ns1:razonSocial)}</ns1:razonSocial>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:rolInterviniente)
                                                                        then <ns1:rolInterviniente>{fn:data($interviniente/ns1:rolInterviniente)}</ns1:rolInterviniente>
                                                                        else ()
                                                                    }
                                                                    {
                                                                        if ($interviniente/ns1:tipoParteInteresada)
                                                                        then <ns1:tipoParteInteresada>{fn:data($interviniente/ns1:tipoParteInteresada)}</ns1:tipoParteInteresada>
                                                                        else ()
                                                                    }
                                                                </ns1:interviniente>
                                                            }
                                                        </ns1:intervinientes>
                                                    else ()
                                                }
                                            </ns1:publicidad>
                                        }
                                    </ns1:listaPublicidades>
                                else ()
                            }
                        </ns1:nuevaMatricula>
                    }
                </ns1:nuevasMatriculas>
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
    </ns1:salidaConsultarNuevasMatriculas>
};

local:func($payloadResponse)
