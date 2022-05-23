xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/cambioLinderosPredios/consultaSegregacionConCambioPropietario/v1";
(:: import schema at "../Schemas/Legacy/EE_CC_ConsultaSegregacionConCambioPropietario.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaConsultaSegregacionConCambioPropietario) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaConsultaSegregacionConCambioPropietario) ::)) as element() (:: schema-element(ns1:salidaConsultaSegregacionConCambioPropietario) ::) {
    <ns1:salidaConsultaSegregacionConCambioPropietario>
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
            if ($payloadResponse/ns1:segregacion)
            then 
                <ns1:segregacion>
                    {
                        if ($payloadResponse/ns1:segregacion/ns1:codigoActo)
                        then <ns1:codigoActo>{fn:data($payloadResponse/ns1:segregacion/ns1:codigoActo)}</ns1:codigoActo>
                        else ()
                    }
                    {
                        if ($payloadResponse/ns1:segregacion/ns1:descripcionActo)
                        then <ns1:descripcionActo>{fn:data($payloadResponse/ns1:segregacion/ns1:descripcionActo)}</ns1:descripcionActo>
                        else ()
                    }
                    {
                        if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz)
                        then 
                            <ns1:matriculaMatriz>
                                {
                                    if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:numMatriculaInmobiliaria)
                                    then <ns1:numMatriculaInmobiliaria>{fn:data($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
                                    else ()
                                }
                                {
                                    if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:direccion)
                                    then <ns1:direccion>{fn:data($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:direccion)}</ns1:direccion>
                                    else ()
                                }
                                {
                                    if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:estado)
                                    then <ns1:estado>{fn:data($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:estado)}</ns1:estado>
                                    else ()
                                }
                                {
                                    if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio)
                                    then 
                                        <ns1:anotacionPredio>
                                            {
                                                if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:comentario)
                                                then <ns1:comentario>{fn:data($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:comentario)}</ns1:comentario>
                                                else ()
                                            }
                                            {
                                                if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:fechaAnotacion)
                                                then <ns1:fechaAnotacion>{fn:data($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                                else ()
                                            }
                                            {
                                                if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:valorActo)
                                                then <ns1:valorActo>{fn:data($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:valorActo)}</ns1:valorActo>
                                                else ()
                                            }
                                            {
                                                if ($payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:propietarios)
                                                then 
                                                    <ns1:propietarios>
                                                        {
                                                            for $propietario in $payloadResponse/ns1:segregacion/ns1:matriculaMatriz/ns1:anotacionPredio/ns1:propietarios/ns1:propietario
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
                                    else ()
                                }
                            </ns1:matriculaMatriz>
                        else ()
                    }
                    {
                        if ($payloadResponse/ns1:segregacion/ns1:matriculasSegregadas)
                        then 
                            <ns1:matriculasSegregadas>
                                {
                                    for $matriculaSegregada in $payloadResponse/ns1:segregacion/ns1:matriculasSegregadas/ns1:matriculaSegregada
                                    return 
                                    <ns1:matriculaSegregada>
                                        {
                                            if ($matriculaSegregada/ns1:numMatriculaInmobiliaria)
                                            then <ns1:numMatriculaInmobiliaria>{fn:data($matriculaSegregada/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
                                            else ()
                                        }
                                        {
                                            if ($matriculaSegregada/ns1:direccion)
                                            then <ns1:direccion>{fn:data($matriculaSegregada/ns1:direccion)}</ns1:direccion>
                                            else ()
                                        }
                                        {
                                            if ($matriculaSegregada/ns1:estado)
                                            then <ns1:estado>{fn:data($matriculaSegregada/ns1:estado)}</ns1:estado>
                                            else ()
                                        }
                                        {
                                            if ($matriculaSegregada/ns1:anotacionPredio)
                                            then 
                                                <ns1:anotacionPredio>
                                                    {
                                                        if ($matriculaSegregada/ns1:anotacionPredio/ns1:comentario)
                                                        then <ns1:comentario>{fn:data($matriculaSegregada/ns1:anotacionPredio/ns1:comentario)}</ns1:comentario>
                                                        else ()
                                                    }
                                                    {
                                                        if ($matriculaSegregada/ns1:anotacionPredio/ns1:fechaAnotacion)
                                                        then <ns1:fechaAnotacion>{fn:data($matriculaSegregada/ns1:anotacionPredio/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                                        else ()
                                                    }
                                                    {
                                                        if ($matriculaSegregada/ns1:anotacionPredio/ns1:valorActo)
                                                        then <ns1:valorActo>{fn:data($matriculaSegregada/ns1:anotacionPredio/ns1:valorActo)}</ns1:valorActo>
                                                        else ()
                                                    }
                                                    {
                                                        if ($matriculaSegregada/ns1:anotacionPredio/ns1:propietarios)
                                                        then 
                                                            <ns1:propietarios>
                                                                {
                                                                    for $propietario in $matriculaSegregada/ns1:anotacionPredio/ns1:propietarios/ns1:propietario
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
                                            else ()
                                        }
                                    </ns1:matriculaSegregada>
                                }
                            </ns1:matriculasSegregadas>
                        else ()
                    }
                </ns1:segregacion>
            else ()
        }
        {
            if ($payloadResponse/ns1:agregacion)
            then 
                <ns1:agregacion>
                    {
                        if ($payloadResponse/ns1:agregacion/ns1:codigoActo)
                        then <ns1:codigoActo>{fn:data($payloadResponse/ns1:agregacion/ns1:codigoActo)}</ns1:codigoActo>
                        else ()
                    }
                    {
                        if ($payloadResponse/ns1:agregacion/ns1:descripcionActo)
                        then <ns1:descripcionActo>{fn:data($payloadResponse/ns1:agregacion/ns1:descripcionActo)}</ns1:descripcionActo>
                        else ()
                    }
                    {
                        if ($payloadResponse/ns1:agregacion/ns1:matriculasMatrices)
                        then 
                            <ns1:matriculasMatrices>
                                {
                                    for $matriculaMatriz in $payloadResponse/ns1:agregacion/ns1:matriculasMatrices/ns1:matriculaMatriz
                                    return 
                                    <ns1:matriculaMatriz>
                                        {
                                            if ($matriculaMatriz/ns1:numMatriculaInmobiliaria)
                                            then <ns1:numMatriculaInmobiliaria>{fn:data($matriculaMatriz/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
                                            else ()
                                        }
                                        {
                                            if ($matriculaMatriz/ns1:direccion)
                                            then <ns1:direccion>{fn:data($matriculaMatriz/ns1:direccion)}</ns1:direccion>
                                            else ()
                                        }
                                        {
                                            if ($matriculaMatriz/ns1:estado)
                                            then <ns1:estado>{fn:data($matriculaMatriz/ns1:estado)}</ns1:estado>
                                            else ()
                                        }
                                        {
                                            if ($matriculaMatriz/ns1:anotacionPredio)
                                            then 
                                                <ns1:anotacionPredio>
                                                    {
                                                        if ($matriculaMatriz/ns1:anotacionPredio/ns1:comentario)
                                                        then <ns1:comentario>{fn:data($matriculaMatriz/ns1:anotacionPredio/ns1:comentario)}</ns1:comentario>
                                                        else ()
                                                    }
                                                    {
                                                        if ($matriculaMatriz/ns1:anotacionPredio/ns1:fechaAnotacion)
                                                        then <ns1:fechaAnotacion>{fn:data($matriculaMatriz/ns1:anotacionPredio/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                                        else ()
                                                    }
                                                    {
                                                        if ($matriculaMatriz/ns1:anotacionPredio/ns1:valorActo)
                                                        then <ns1:valorActo>{fn:data($matriculaMatriz/ns1:anotacionPredio/ns1:valorActo)}</ns1:valorActo>
                                                        else ()
                                                    }
                                                    {
                                                        if ($matriculaMatriz/ns1:anotacionPredio/ns1:propietarios)
                                                        then 
                                                            <ns1:propietarios>
                                                                {
                                                                    for $propietario1 in $matriculaMatriz/ns1:anotacionPredio/ns1:propietarios/ns1:propietario
                                                                    return 
                                                                    <ns1:propietario>
                                                                        {
                                                                            if ($propietario1/ns1:tipoPersona)
                                                                            then <ns1:tipoPersona>{fn:data($propietario1/ns1:tipoPersona)}</ns1:tipoPersona>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($propietario1/ns1:tipoDocumentoPersona)
                                                                            then <ns1:tipoDocumentoPersona>{fn:data($propietario1/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($propietario1/ns1:numDocumentoPersona)
                                                                            then <ns1:numDocumentoPersona>{fn:data($propietario1/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($propietario1/ns1:DRR)
                                                                            then <ns1:DRR>{fn:data($propietario1/ns1:DRR)}</ns1:DRR>
                                                                            else ()
                                                                        }
                                                                        {
                                                                            if ($propietario1/ns1:porcentajeParticipacion)
                                                                            then <ns1:porcentajeParticipacion>{fn:data($propietario1/ns1:porcentajeParticipacion)}</ns1:porcentajeParticipacion>
                                                                            else ()
                                                                        }
                                                                    </ns1:propietario>
                                                                }
                                                            </ns1:propietarios>
                                                        else ()
                                                    }
                                                </ns1:anotacionPredio>
                                            else ()
                                        }
                                    </ns1:matriculaMatriz>
                                }
                            </ns1:matriculasMatrices>
                        else ()
                    }
                    {
                        if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada)
                        then 
                            <ns1:matriculaAgregada>
                                {
                                    if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:numMatriculaInmobiliaria)
                                    then <ns1:numMatriculaInmobiliaria>{fn:data($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:numMatriculaInmobiliaria)}</ns1:numMatriculaInmobiliaria>
                                    else ()
                                }
                                {
                                    if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:direccion)
                                    then <ns1:direccion>{fn:data($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:direccion)}</ns1:direccion>
                                    else ()
                                }
                                {
                                    if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:estado)
                                    then <ns1:estado>{fn:data($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:estado)}</ns1:estado>
                                    else ()
                                }
                                {
                                    if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio)
                                    then 
                                        <ns1:anotacionPredio>
                                            {
                                                if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:comentario)
                                                then <ns1:comentario>{fn:data($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:comentario)}</ns1:comentario>
                                                else ()
                                            }
                                            {
                                                if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:fechaAnotacion)
                                                then <ns1:fechaAnotacion>{fn:data($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:fechaAnotacion)}</ns1:fechaAnotacion>
                                                else ()
                                            }
                                            {
                                                if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:valorActo)
                                                then <ns1:valorActo>{fn:data($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:valorActo)}</ns1:valorActo>
                                                else ()
                                            }
                                            {
                                                if ($payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:propietarios)
                                                then 
                                                    <ns1:propietarios>
                                                        {
                                                            for $propietario1 in $payloadResponse/ns1:agregacion/ns1:matriculaAgregada/ns1:anotacionPredio/ns1:propietarios/ns1:propietario
                                                            return 
                                                            <ns1:propietario>
                                                                {
                                                                    if ($propietario1/ns1:tipoPersona)
                                                                    then <ns1:tipoPersona>{fn:data($propietario1/ns1:tipoPersona)}</ns1:tipoPersona>
                                                                    else ()
                                                                }
                                                                {
                                                                    if ($propietario1/ns1:tipoDocumentoPersona)
                                                                    then <ns1:tipoDocumentoPersona>{fn:data($propietario1/ns1:tipoDocumentoPersona)}</ns1:tipoDocumentoPersona>
                                                                    else ()
                                                                }
                                                                {
                                                                    if ($propietario1/ns1:numDocumentoPersona)
                                                                    then <ns1:numDocumentoPersona>{fn:data($propietario1/ns1:numDocumentoPersona)}</ns1:numDocumentoPersona>
                                                                    else ()
                                                                }
                                                                {
                                                                    if ($propietario1/ns1:DRR)
                                                                    then <ns1:DRR>{fn:data($propietario1/ns1:DRR)}</ns1:DRR>
                                                                    else ()
                                                                }
                                                                {
                                                                    if ($propietario1/ns1:porcentajeParticipacion)
                                                                    then <ns1:porcentajeParticipacion>{fn:data($propietario1/ns1:porcentajeParticipacion)}</ns1:porcentajeParticipacion>
                                                                    else ()
                                                                }
                                                            </ns1:propietario>
                                                        }
                                                    </ns1:propietarios>
                                                else ()
                                            }
                                        </ns1:anotacionPredio>
                                    else ()
                                }
                            </ns1:matriculaAgregada>
                        else ()
                    }
                </ns1:agregacion>
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
    </ns1:salidaConsultaSegregacionConCambioPropietario>
};

local:func($payloadResponse)
