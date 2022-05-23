xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns8="https://www.supernotariado.gov.co/services/bachue/cb/anotaciones/consultarAnotaciones/v1";
(:: import schema at "../Schemas/Legacy/CB_A_consultarAnotaciones.xsd" ::)
declare namespace ns9="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosImueble/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDatosInmueble.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDireccionesAnteriores/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDireccionesAnteriores.xsd" ::)
declare namespace ns3="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarPropietarios/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarPropietarios.xsd" ::)
declare namespace ns4="https://www.supernotariado.gov.co/services/bachue/cb/matriculasrelacionadas/consultarMatriculasDerivadas/v1";
(:: import schema at "../Schemas/Legacy/CB_MR_consultarMatriculasDerivadas.xsd" ::)
declare namespace ns5="https://www.supernotariado.gov.co/services/bachue/cb/matriculasrelacionadas/consultarMatriculasMatriz/v1";
(:: import schema at "../Schemas/Legacy/CB_MR_consultarMatriculasMatriz.xsd" ::)
declare namespace ns6="https://www.supernotariado.gov.co/services/bachue/cb/salvedades/consultarSalvedades/v1";
(:: import schema at "../Schemas/Legacy/CB_S_consultarSalvedades.xsd" ::)
declare namespace ns7="https://www.supernotariado.gov.co/services/bachue/cb/tramitesencurso/consultarTramites/v1";
(:: import schema at "../Schemas/Legacy/CB_TEC_consultarTramites.xsd" ::)

declare variable $payloadCBConsultarDatosInmueblesResponse as element() (:: schema-element(ns1:salidaDatosInmueble) ::) external;
declare variable $payloadCBConsultarDireccionesAnteriores as element() (:: schema-element(ns2:salidaDireccionesAnteriores) ::) external;
declare variable $payloadCBConsultarPropietarios as element() (:: schema-element(ns3:salidaDatosPropietario) ::) external;
declare variable $payloadCBConsultarMatriculasDerivadas as element() (:: schema-element(ns4:salidaDatosMatriculasDerivadas) ::) external;
declare variable $payloadCBConsultarMatriculasMatriz as element() (:: schema-element(ns5:salidaDatosMatriculasMatriz) ::) external;
declare variable $payloadCBConsultarSalvedades as element() (:: schema-element(ns6:salidaDatosSalvedades) ::) external;
declare variable $payloadCBConsultarTramites as element() (:: schema-element(ns7:salidaDatosTramitesEnCurso) ::) external;
declare variable $payloadCBConsultarAnotaciones as element() (:: schema-element(ns8:salidaDatosAnotacion) ::) external;

declare function local:func($payloadCBConsultarDatosInmueblesResponse as element() (:: schema-element(ns1:salidaDatosInmueble) ::), 
                            $payloadCBConsultarDireccionesAnteriores as element() (:: schema-element(ns2:salidaDireccionesAnteriores) ::), 
                            $payloadCBConsultarPropietarios as element() (:: schema-element(ns3:salidaDatosPropietario) ::), 
                            $payloadCBConsultarMatriculasDerivadas as element() (:: schema-element(ns4:salidaDatosMatriculasDerivadas) ::), 
                            $payloadCBConsultarMatriculasMatriz as element() (:: schema-element(ns5:salidaDatosMatriculasMatriz) ::), 
                            $payloadCBConsultarSalvedades as element() (:: schema-element(ns6:salidaDatosSalvedades) ::), 
                            $payloadCBConsultarTramites as element() (:: schema-element(ns7:salidaDatosTramitesEnCurso) ::), 
                            $payloadCBConsultarAnotaciones as element() (:: schema-element(ns8:salidaDatosAnotacion) ::)) 
                            as element() (:: schema-element(ns9:salidaConsultaCT) ::) {
    <ns9:salidaConsultaCT>
        <ns9:numMatriculaInmobiliaria>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:numMatriculaInmobiliaria)}</ns9:numMatriculaInmobiliaria>
        <ns9:codCirculoRegistral>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codCirculoRegistral)}</ns9:codCirculoRegistral>
        <ns9:nomCirculoRegistral>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomCirculoRegistral)}</ns9:nomCirculoRegistral>
        <ns9:NUPRE>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:NUPRE)}</ns9:NUPRE>
        <ns9:estadoNUPRE>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:estadoNUPRE)}</ns9:estadoNUPRE>
        <ns9:numPredial>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:numPredial)}</ns9:numPredial>
        <ns9:numPredialAnterior>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:numPredialAnterior)}</ns9:numPredialAnterior>
        <ns9:direccionPredio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:direccionPredio)}</ns9:direccionPredio>
        <ns9:codDepartamento>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codDepartamento)}</ns9:codDepartamento>
        <ns9:nomDepartamento>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomDepartamento)}</ns9:nomDepartamento>
        <ns9:codMunicipio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codMunicipio)}</ns9:codMunicipio>
        <ns9:nomMunicipio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomMunicipio)}</ns9:nomMunicipio>
        <ns9:nomVereda>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomVereda)}</ns9:nomVereda>
        <ns9:nomBarrio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomBarrio)}</ns9:nomBarrio>
        <ns9:fechaAperturaFolio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:fechaAperturaFolio)}</ns9:fechaAperturaFolio>
        <ns9:fechaInstrumento>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:fechaInstrumento)}</ns9:fechaInstrumento>
        <ns9:radicacion>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:radicacion)}</ns9:radicacion>
        <ns9:nomTipoDocumentoPublico>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomTipoDocumentoPublico)}</ns9:nomTipoDocumentoPublico>
        <ns9:NIR>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:NIR)}</ns9:NIR>
        <ns9:areaInmueble>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:areaInmueble)}</ns9:areaInmueble>
        <ns9:areaConstruida>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:areaConstruida)}</ns9:areaConstruida>
        <ns9:areaPrivada>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:areaPrivada)}</ns9:areaPrivada>
        <ns9:estadoFolio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:estadoFolio)}</ns9:estadoFolio>
        <ns9:tipoPredio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:tipoPredio)}</ns9:tipoPredio>
        <ns9:linderos>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:linderos)}</ns9:linderos>
        {
            for $propietarios in $payloadCBConsultarPropietarios/ns3:propietarios
            return 
            <ns9:propietarios>
                <ns9:tipoPersona>{fn:data($propietarios/ns3:tipoPersona)}</ns9:tipoPersona>
                <ns9:tipoDocumentoPersona>{fn:data($propietarios/ns3:tipoDocumentoPersona)}</ns9:tipoDocumentoPersona>
                <ns9:numDocumentoPersona>{fn:data($propietarios/ns3:numDocumentoPersona)}</ns9:numDocumentoPersona>
                <ns9:numNIT>{fn:data($propietarios/ns3:numNIT)}</ns9:numNIT>
                <ns9:primerApellido>{fn:data($propietarios/ns3:primerApellido)}</ns9:primerApellido>
                <ns9:segundoApellido>{fn:data($propietarios/ns3:segundoApellido)}</ns9:segundoApellido>
                <ns9:primerNombre>{fn:data($propietarios/ns3:primerNombre)}</ns9:primerNombre>
                <ns9:segundoNombre>{fn:data($propietarios/ns3:segundoNombre)}</ns9:segundoNombre>
                <ns9:codGenero>{fn:data($propietarios/ns3:codGenero)}</ns9:codGenero>
                <ns9:razonSocial>{fn:data($propietarios/ns3:razonSocial)}</ns9:razonSocial>
                <ns9:porcentajeParticipacion>{fn:data($propietarios/ns3:porcentajeParticipacion)}</ns9:porcentajeParticipacion></ns9:propietarios>
        }
        <ns9:complementaciones>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:complementaciones)}</ns9:complementaciones>
        {
            for $salvedades in $payloadCBConsultarSalvedades/ns6:salvedades
            return 
            <ns9:salvedades>
                <ns9:numAnotacion>{fn:data($salvedades/ns6:numAnotacion)}</ns9:numAnotacion>
                <ns9:numeroCorreccion>{fn:data($salvedades/ns6:numeroCorreccion)}</ns9:numeroCorreccion>
                <ns9:NIR>{fn:data($salvedades/ns6:NIR)}</ns9:NIR>
                <ns9:radicacion>{fn:data($salvedades/ns6:radicacion)}</ns9:radicacion>
                <ns9:fechaSalvedad>{fn:data($salvedades/ns6:fechaSalvedad)}</ns9:fechaSalvedad>
                <ns9:descripcionSalvedad>{fn:data($salvedades/ns6:descripcionSalvedad)}</ns9:descripcionSalvedad></ns9:salvedades>
        }
        {
            for $direccionesPredioAnteriores in $payloadCBConsultarDireccionesAnteriores/ns2:direccionesPredioAnteriores
            return 
            <ns9:direccionesPredioAnteriores>
                <ns9:direccionPredio>{fn:data($direccionesPredioAnteriores/ns2:direccionPredio)}</ns9:direccionPredio></ns9:direccionesPredioAnteriores>
        }
        {
            for $matriculasMatriz in $payloadCBConsultarMatriculasMatriz/ns5:matriculasMatriz
            return 
            <ns9:matriculasMatriz>
                <ns9:numMatriculaInmobiliaria>{fn:data($matriculasMatriz/ns5:numMatriculaInmobiliaria)}</ns9:numMatriculaInmobiliaria>
                <ns9:codCirculoRegistral>{fn:data($matriculasMatriz/ns5:codCirculoRegistral)}</ns9:codCirculoRegistral></ns9:matriculasMatriz>
        }
        {
            for $matriculasDerivadas in $payloadCBConsultarMatriculasDerivadas/ns4:matriculasDerivadas
            return 
            <ns9:matriculasDerivadas>
                <ns9:numMatriculaInmobiliaria>{fn:data($matriculasDerivadas/ns4:numMatriculaInmobiliaria)}</ns9:numMatriculaInmobiliaria>
                <ns9:codCirculoRegistral>{fn:data($matriculasDerivadas/ns4:codCirculoRegistral)}</ns9:codCirculoRegistral>
                <ns9:direccionPredio>{fn:data($matriculasDerivadas/ns4:direccionPredio)}</ns9:direccionPredio>
                <ns9:NIR>{fn:data($matriculasDerivadas/ns4:NIR)}</ns9:NIR>
                <ns9:radicacion>{fn:data($matriculasDerivadas/ns4:radicacion)}</ns9:radicacion>
                <ns9:anotacionRelacionada>{fn:data($matriculasDerivadas/ns4:anotacionRelacionada)}</ns9:anotacionRelacionada></ns9:matriculasDerivadas>
        }
        {
            for $anotaciones in $payloadCBConsultarAnotaciones/ns8:anotaciones
            return 
            <ns9:medidasCautelares>
                <ns9:numAnotacion>{fn:data($anotaciones/ns8:numAnotacion)}</ns9:numAnotacion>
                {
                    for $anotacionesCanceladas in $anotaciones/ns8:anotacionesCanceladas
                    return 
                    <ns9:anotacionesCanceladas>
                        <ns9:anotacionCancelada>{fn:data($anotacionesCanceladas/ns8:anotacionCancelada)}</ns9:anotacionCancelada></ns9:anotacionesCanceladas>
                }
                <ns9:comentario>{fn:data($anotaciones/ns8:comentario)}</ns9:comentario>
                <ns9:codTipoDocumentoPublico>{fn:data($anotaciones/ns8:codTipoDocumentoPublico)}</ns9:codTipoDocumentoPublico>
                <ns9:fechaDocumento>{fn:data($anotaciones/ns8:fechaDocumento)}</ns9:fechaDocumento>
                <ns9:nomDocumentoPublico>{fn:data($anotaciones/ns8:nomDocumentoPublico)}</ns9:nomDocumentoPublico>
                <ns9:codDominioActoJuridico>{fn:data($anotaciones/ns8:codDominioActoJuridico)}</ns9:codDominioActoJuridico>
                <ns9:nomDominioActoJuridico>{fn:data($anotaciones/ns8:nomDominioActoJuridico)}</ns9:nomDominioActoJuridico>
                <ns9:oficinaOrigen>{fn:data($anotaciones/ns8:oficinaOrigen)}</ns9:oficinaOrigen>
                <ns9:comentarioEspecificoAnotacion>{fn:data($anotaciones/ns8:comentarioEspecificoAnotacion)}</ns9:comentarioEspecificoAnotacion>
                <ns9:DRR>{fn:data($anotaciones/ns8:DRR)}</ns9:DRR>
                <ns9:codNaturalezaJuridicaFolio>{fn:data($anotaciones/ns8:codNaturalezaJuridicaFolio)}</ns9:codNaturalezaJuridicaFolio>
                <ns9:fechaAnotacion>{fn:data($anotaciones/ns8:fechaAnotacion)}</ns9:fechaAnotacion>
                {
                    for $intervinientes in $anotaciones/ns8:intervinientes
                    return 
                    <ns9:intervinientes>
                        <ns9:rolInterviniente>{fn:data($intervinientes/ns8:rolInterviniente)}</ns9:rolInterviniente>
                        <ns9:tipoPersona>{fn:data($intervinientes/ns8:tipoPersona)}</ns9:tipoPersona>
                        <ns9:esPropietario>{fn:data($intervinientes/ns8:esPropietario)}</ns9:esPropietario>
                        <ns9:tipoDocumentoPersona>{fn:data($intervinientes/ns8:tipoDocumentoPersona)}</ns9:tipoDocumentoPersona>
                        <ns9:numDocumentoPersona>{fn:data($intervinientes/ns8:numDocumentoPersona)}</ns9:numDocumentoPersona>
                        <ns9:numNIT>{fn:data($intervinientes/ns8:numNIT)}</ns9:numNIT>
                        <ns9:porcentajeParticipacion>{fn:data($intervinientes/ns8:porcentajeParticipacion)}</ns9:porcentajeParticipacion>
                        <ns9:primerNombre>{fn:data($intervinientes/ns8:primerNombre)}</ns9:primerNombre>
                        <ns9:segundoNombre>{fn:data($intervinientes/ns8:segundoNombre)}</ns9:segundoNombre>
                        <ns9:primerApellido>{fn:data($intervinientes/ns8:primerApellido)}</ns9:primerApellido>
                        <ns9:segundoApellido>{fn:data($intervinientes/ns8:segundoApellido)}</ns9:segundoApellido>
                        <ns9:codGenero>{fn:data($intervinientes/ns8:codGenero)}</ns9:codGenero>
                        <ns9:razonSocial>{fn:data($intervinientes/ns8:razonSocial)}</ns9:razonSocial></ns9:intervinientes>
                }
                <ns9:NIR>{fn:data($anotaciones/ns8:NIR)}</ns9:NIR>
                <ns9:radicacion>{fn:data($anotaciones/ns8:radicacion)}</ns9:radicacion>
                <ns9:estadoAnotacion>{fn:data($anotaciones/ns8:estadoAnotacion)}</ns9:estadoAnotacion>
                <ns9:valorActo>{fn:data($anotaciones/ns8:valorActo)}</ns9:valorActo></ns9:medidasCautelares>
        }
        <ns9:tramitesEnCurso>
            <ns9:NIR>{fn:data($payloadCBConsultarTramites/ns7:NIR)}</ns9:NIR>
            <ns9:fechaHoraNIR>{fn:data($payloadCBConsultarTramites/ns7:fechaHoraNIR)}</ns9:fechaHoraNIR>
            <ns9:radicacion>{fn:data($payloadCBConsultarTramites/ns7:radicacion)}</ns9:radicacion>
            <ns9:fechaRadicacion>{fn:data($payloadCBConsultarTramites/ns7:fechaRadicacion)}</ns9:fechaRadicacion>
            {
                for $tiposActo in $payloadCBConsultarTramites/ns7:tiposActo
                return 
                <ns9:tiposActo>
                    <ns9:descripcionActo>{fn:data($tiposActo/ns7:descripcionActo)}</ns9:descripcionActo>
                    <ns9:valorActo>{fn:data($tiposActo/ns7:valorActo)}</ns9:valorActo></ns9:tiposActo>
            }
            <ns9:oficinaOrigen>{fn:data($payloadCBConsultarTramites/ns7:oficinaOrigen)}</ns9:oficinaOrigen>
            <ns9:nomMunicipio>{fn:data($payloadCBConsultarTramites/ns7:nomMunicipio)}</ns9:nomMunicipio>
        </ns9:tramitesEnCurso>
        {
                if (fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codMensaje/text()= "200") and ($payloadCBConsultarDireccionesAnteriores/ns2:codMensaje/text()= "200") and ($payloadCBConsultarPropietarios/ns3:codMensaje/text()= "200")and($payloadCBConsultarMatriculasDerivadas/ns4:codMensaje/text()= "200")and($payloadCBConsultarMatriculasMatriz/ns5:codMensaje/text()= "200")and($payloadCBConsultarSalvedades/ns6:codMensaje/text()= "200")and($payloadCBConsultarTramites/ns7:codMensaje/text()= "200")and($payloadCBConsultarAnotaciones/ns8:anotaciones/ns8:codMensaje/text()= "200"))
                then <ns9:codMensaje>200</ns9:codMensaje>
                else (
                <ns9:codMensaje>201</ns9:codMensaje>)
        }
        {
                if ($payloadCBConsultarDatosInmueblesResponse/ns1:codMensaje/text()= "201")
                then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:descripcionMensaje)}</ns9:descripcionMensaje>
                else (if ($payloadCBConsultarDireccionesAnteriores/ns2:codMensaje/text()= "201")
                      then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarDireccionesAnteriores/ns2:descripcionMensaje)}</ns9:descripcionMensaje>
                      else (if ($payloadCBConsultarPropietarios/ns3:codMensaje/text()= "201")
                            then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarPropietarios/ns3:descripcionMensaje)}</ns9:descripcionMensaje>
                            else (if ($payloadCBConsultarMatriculasDerivadas/ns4:codMensaje/text()= "201")
                                  then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarMatriculasDerivadas/ns4:descripcionMensaje)}</ns9:descripcionMensaje>
                                  else (if ($payloadCBConsultarMatriculasMatriz/ns5:codMensaje/text()= "201")
                                          then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarMatriculasMatriz/ns5:descripcionMensaje)}</ns9:descripcionMensaje>
                                          else (if ($payloadCBConsultarSalvedades/ns6:codMensaje/text()= "201")
                                              then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarSalvedades/ns6:descripcionMensaje)}</ns9:descripcionMensaje>
                                                else (if ($payloadCBConsultarTramites/ns7:codMensaje/text()= "201")
                                                    then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarTramites/ns7:descripcionMensaje)}</ns9:descripcionMensaje>
                                                    else (if ($payloadCBConsultarAnotaciones/ns8:anotaciones/ns8:codMensaje/text()= "201")
                                                        then <ns9:descripcionMensaje>{fn:data($payloadCBConsultarAnotaciones/ns8:anotaciones/ns8:descripcionMensaje)}</ns9:descripcionMensaje>
                                                       else (<ns9:descripcionMensaje></ns9:descripcionMensaje>)
                          )
                         )
                       )
                      )
                    )
                  )
                )
        }
        <ns9:numeroConsulta></ns9:numeroConsulta>
        <ns9:fechaHoraConsulta></ns9:fechaHoraConsulta>
    </ns9:salidaConsultaCT>
};

local:func($payloadCBConsultarDatosInmueblesResponse, $payloadCBConsultarDireccionesAnteriores, $payloadCBConsultarPropietarios, $payloadCBConsultarMatriculasDerivadas, $payloadCBConsultarMatriculasMatriz, $payloadCBConsultarSalvedades, $payloadCBConsultarTramites, $payloadCBConsultarAnotaciones)
