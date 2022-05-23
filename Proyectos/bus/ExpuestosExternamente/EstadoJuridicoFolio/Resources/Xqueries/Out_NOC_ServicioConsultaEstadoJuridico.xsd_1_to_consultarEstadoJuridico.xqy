xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaEstadoJuridico.xsd_1.xsd" ::)
declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_EJF_consultarEstadoJuridico.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:consultaEstadoJuridicoResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:consultaEstadoJuridicoResponse) ::)) as element() (:: schema-element(ns2:consultaEstadoJuridicoRespuesta) ::) {
    <ns2:consultaEstadoJuridicoRespuesta>
        <ns2:numMatriculaInmobiliaria>{fn:data($payloadResponse/return/datosBasicosInmueble/numeroMatricula)}</ns2:numMatriculaInmobiliaria>
        <ns2:codCirculoRegistral>{fn:data($payloadResponse/return/datosBasicosInmueble/tipoCirculoRegistral/jurisdiccionPredio)}</ns2:codCirculoRegistral>
        <ns2:nomCirculoRegistral>{fn:data($payloadResponse/return/datosBasicosInmueble/tipoCirculoRegistral/nombreJurisdiccionPredio)}</ns2:nomCirculoRegistral>
        <ns2:numPredial>{fn:data($payloadResponse/return/datosBasicosInmueble/chipPredio)}</ns2:numPredial>
        <ns2:numPredialAnterior>{fn:data($payloadResponse/return/datosBasicosInmueble/chipPredio)}</ns2:numPredialAnterior>
        <ns2:NUPRE></ns2:NUPRE>
        <ns2:estadoNUPRE></ns2:estadoNUPRE>
        <ns2:direccionPredio>{fn:data($payloadResponse/return/datosBasicosInmueble/direccionInmueble)}</ns2:direccionPredio>
        <ns2:codDepartamento>{fn:data($payloadResponse/return/datosBasicosInmueble/departamentoPredio/codDepartamento)}</ns2:codDepartamento>
        <ns2:nomDepartamento>{fn:data($payloadResponse/return/datosBasicosInmueble/departamentoPredio/nomDepartamento)}</ns2:nomDepartamento>
        <ns2:codMunicipio>{fn:data($payloadResponse/return/datosBasicosInmueble/municipioPredio/codMunicipio)}</ns2:codMunicipio>
        <ns2:nomMunicipio>{fn:data($payloadResponse/return/datosBasicosInmueble/municipioPredio/nomMunicipio)}</ns2:nomMunicipio>

               {
            for $personaRecibePredio in $payloadResponse/return/datosBasicosInmueble/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio
            where $personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion eq $personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion
            return 
            <ns2:propietarios>
      
            {
                if (count($payloadResponse/return/datosBasicosInmueble/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio/personaNacionalIntervieneActo)!= 0)
                then <ns2:tipoPersona>Natural</ns2:tipoPersona>
                else (
                <ns2:tipoPersona>Jurídica</ns2:tipoPersona>)
            }
                <ns2:tipoDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion)}</ns2:tipoDocumentoPersona>
            {
                if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CC")
                then <ns2:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroCedulaCiudadania)}</ns2:numDocumentoPersona>
                else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "RC")
                      then <ns2:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numRegistroCivil)}</ns2:numDocumentoPersona>
                      else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "TI")
                            then <ns2:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numTarjetaIdentidad)}</ns2:numDocumentoPersona>
                            else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CE")
                                  then <ns2:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numCedulaExtranjeria)}</ns2:numDocumentoPersona>
                                  else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "PA")
                                        then <ns2:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroPasaporte)}</ns2:numDocumentoPersona>
                                        else ()
                      )
                    )
                  )
                )
             }
                <ns2:numNIT>{fn:data($personaRecibePredio/personaJuridicaIntervieneActo/numIdTributaria)}</ns2:numNIT>
                <ns2:primerApellido>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/primerApellido)}</ns2:primerApellido>
                <ns2:segundoApellido>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/segundoApellido)}</ns2:segundoApellido>
                <ns2:primerNombre>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/primerNombre)}</ns2:primerNombre>
                <ns2:segundoNombre>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/segundoNombre)}</ns2:segundoNombre>
                <ns2:razonSocial>{fn:data($personaRecibePredio/personaJuridicaIntervieneActo/razonSocial)}</ns2:razonSocial>
                <ns2:porcentajeParticipacion>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/porcentajeParticipacion)}</ns2:porcentajeParticipacion>
               </ns2:propietarios>
        }
        {
            for $anotacionCertificadoTradicion in $payloadResponse/return/estadoJuridicoInmueble/listaAnotacionEstadoJuridico/anotacionCertificadoTradicion
            return 
            <ns2:anotaciones>
                <ns2:numAnotacion>{fn:data($anotacionCertificadoTradicion/numeroAnotacion)}</ns2:numAnotacion>
                
                <ns2:anotacionesCanceladas>
                    <ns2:anotacionCancelada>{fn:data($anotacionCertificadoTradicion/cancelacionAnotacion/numeroAnotacion)}</ns2:anotacionCancelada>
                </ns2:anotacionesCanceladas>
                <ns2:comentario>{fn:data($anotacionCertificadoTradicion/comentario)}</ns2:comentario>
                <ns2:codTipoDocumentoPublico></ns2:codTipoDocumentoPublico>
                <ns2:fechaDocumento>{fn:data($anotacionCertificadoTradicion/documentoAnotacionCertificadoTradicion/fechaDocumentoAnotacion)}</ns2:fechaDocumento>
                <ns2:nomDocumentoPublico>{fn:data($anotacionCertificadoTradicion/documentoAnotacionCertificadoTradicion/nomDocumentoAnotacionFolio)}</ns2:nomDocumentoPublico>
                <ns2:codDominioActoJuridico>{fn:data($anotacionCertificadoTradicion/dominio)}</ns2:codDominioActoJuridico>
                <ns2:nomDominioActoJuridico>{fn:data($anotacionCertificadoTradicion/dominio)}</ns2:nomDominioActoJuridico>
                <ns2:oficinaOrigen>{fn:data($anotacionCertificadoTradicion/entidadAnotacion)}</ns2:oficinaOrigen>
                <ns2:comentarioEspecificoAnotacion>{fn:data($anotacionCertificadoTradicion/especificacionAnotacionFolio/comentarioEspecificaAnotacionFolio)}</ns2:comentarioEspecificoAnotacion>
                <ns2:DRR></ns2:DRR>
                <ns2:codNaturalezaJuridicaFolio></ns2:codNaturalezaJuridicaFolio>
                <ns2:fechaAnotacion>{fn:data($anotacionCertificadoTradicion/fechaAnotacion)}</ns2:fechaAnotacion>
                {
                    for $personaCedePredio in $anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaCedePredio
                    return 
                        
                        
                        <ns2:intervinientes>
                            <ns2:rolInterviniente></ns2:rolInterviniente>
                            {
                              if (count($payloadResponse/return/estadoJuridicoInmueble/listaAnotacionEstadoJuridico/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaCedePredio/personaNacionalIntervieneActo)!= 0)
                              then <ns2:tipoPersona>Natural</ns2:tipoPersona>
                              else (
                              <ns2:tipoPersona>Jurídica</ns2:tipoPersona>)
                            }
                            
                            <ns2:esPropietario>{fn:data($personaCedePredio/personaNacionalIntervieneActo/esPropietario)}</ns2:esPropietario>
                            <ns2:tipoDocumentoPersona>{fn:data($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion)}</ns2:tipoDocumentoPersona>
                            {
                            if ($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CC")
                            then <ns2:numDocumentoPersona>{fn:data($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroCedulaCiudadania)}</ns2:numDocumentoPersona>
                            else (if ($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "RC")
                                  then <ns2:numDocumentoPersona>{fn:data($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numRegistroCivil)}</ns2:numDocumentoPersona>
                                  else (if ($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "TI")
                                        then <ns2:numDocumentoPersona>{fn:data($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numTarjetaIdentidad)}</ns2:numDocumentoPersona>
                                        else (if ($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CE")
                                              then <ns2:numDocumentoPersona>{fn:data($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numCedulaExtranjeria)}</ns2:numDocumentoPersona>
                                              else (if ($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "PA")
                                                    then <ns2:numDocumentoPersona>{fn:data($personaCedePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroPasaporte)}</ns2:numDocumentoPersona>
                                                    else ()
                                      )
                                    )
                                  )
                                )
                            } 
                            <ns2:numNIT></ns2:numNIT>
                            <ns2:porcentajeParticipacion>{fn:data($personaCedePredio/personaJuridicaIntervieneActo/porcentajeParticipacion)}</ns2:porcentajeParticipacion>
                            <ns2:porcentajeParticipacion>{fn:data($personaCedePredio/personaNacionalIntervieneActo/porcentajeParticipacion)}</ns2:porcentajeParticipacion>
                            <ns2:primerNombre>{fn:data($personaCedePredio/personaNacionalIntervieneActo/nomPersonaIndividual/primerNombre)}</ns2:primerNombre>
                            <ns2:segundoNombre>{fn:data($personaCedePredio/personaNacionalIntervieneActo/nomPersonaIndividual/segundoNombre)}</ns2:segundoNombre>
                            <ns2:primerApellido>{fn:data($personaCedePredio/personaNacionalIntervieneActo/nomPersonaIndividual/primerApellido)}</ns2:primerApellido>
                            <ns2:segundoApellido>{fn:data($personaCedePredio/personaNacionalIntervieneActo/nomPersonaIndividual/segundoApellido)}</ns2:segundoApellido>
                            <ns2:codGenero></ns2:codGenero>
                            <ns2:razonSocial>{fn:data($personaCedePredio/personaJuridicaIntervieneActo/razonSocial)}</ns2:razonSocial>
                        </ns2:intervinientes>
                }
                
                <ns2:NIR></ns2:NIR>
                <ns2:radicacion>{fn:data($anotacionCertificadoTradicion/radicacionAnotacion)}</ns2:radicacion>
                <ns2:estadoAnotacion>{fn:data($anotacionCertificadoTradicion/validez)}</ns2:estadoAnotacion>
                <ns2:valorActo>{fn:data($anotacionCertificadoTradicion/valorActo/cantidadMonetaria)}</ns2:valorActo></ns2:anotaciones>
        }
     
        <ns2:matriculasMatriz>
            <ns2:numMatriculaInmobiliaria>{fn:data($payloadResponse/return/listaMatriculaRelacionadaPredio/matriculaRelacionadaSNR/numeroMatriculaPredio)}</ns2:numMatriculaInmobiliaria>
            <ns2:codCirculoRegistral>{fn:data($payloadResponse/return/listaMatriculaRelacionadaPredio/matriculaRelacionadaSNR/circulo)}</ns2:codCirculoRegistral>
        </ns2:matriculasMatriz>
        <ns2:matriculasDerivadas>
            <ns2:numMatriculaInmobiliaria></ns2:numMatriculaInmobiliaria>
            <ns2:codCirculoRegistral></ns2:codCirculoRegistral>
            <ns2:direccionPredio>{fn:data($payloadResponse/return/listaMatriculaRelacionadaPredio/matriculaRelacionadaSNR/descripcion)}</ns2:direccionPredio>
            <ns2:NIR></ns2:NIR>
            <ns2:radicacion>{fn:data($payloadResponse/return/listaMatriculaRelacionadaPredio/matriculaRelacionadaSNR/radicacion)}</ns2:radicacion>
            <ns2:anotacionRelacionada>{fn:data($payloadResponse/return/listaMatriculaRelacionadaPredio/matriculaRelacionadaSNR/anotacionRelacionada)}</ns2:anotacionRelacionada>
        </ns2:matriculasDerivadas>
        {
            for $listaMedidasCautelares in $payloadResponse/return/listaMedidasCautelares
            return 
            <ns2:medidasCautelares>
                <ns2:numAnotacion>{fn:data($listaMedidasCautelares/numeroAnotacion)}</ns2:numAnotacion>
            <ns2:anotacionesCanceladas>
                <ns2:anotacionCancelada>{fn:data($payloadResponse/return/listaMedidasCautelares/cancelacionAnotacion/numeroAnotacion)}</ns2:anotacionCancelada>
            </ns2:anotacionesCanceladas>
            <ns2:comentario>{fn:data($payloadResponse/return/listaMedidasCautelares/comentario)}</ns2:comentario>
            <ns2:codTipoDocumentoPublico>{fn:data($payloadResponse/return/listaMedidasCautelares/documentoAnotacionCertificadoTradicion/codDocumentoAnotacionFolio)}</ns2:codTipoDocumentoPublico>
            <ns2:fechaDocumento>{fn:data($payloadResponse/return/listaMedidasCautelares/documentoAnotacionCertificadoTradicion/fechaDocumentoAnotacion)}</ns2:fechaDocumento>
            <ns2:nomDocumentoPublico>{fn:data($payloadResponse/return/listaMedidasCautelares/documentoAnotacionCertificadoTradicion/nomDocumentoAnotacionFolio)}</ns2:nomDocumentoPublico>
            <ns2:codDominioActoJuridico>{fn:data($payloadResponse/return/listaMedidasCautelares/dominio)}</ns2:codDominioActoJuridico>
            <ns2:nomDominioActoJuridico>{fn:data($payloadResponse/return/listaMedidasCautelares/dominio)}</ns2:nomDominioActoJuridico>
            <ns2:oficinaOrigen>{fn:data($payloadResponse/return/listaMedidasCautelares/entidadAnotacion)}</ns2:oficinaOrigen>
            <ns2:comentarioEspecificoAnotacion>{fn:data($listaMedidasCautelares/especificacionAnotacionFolio/comentarioEspecificaAnotacionFolio)}</ns2:comentarioEspecificoAnotacion>
            <ns2:DRR></ns2:DRR>
                <ns2:codNaturalezaJuridicaFolio>{fn:data($listaMedidasCautelares/especificacionAnotacionFolio/naturalezaJuridicaFolio/codNaturalezaJuridicaFolio)}</ns2:codNaturalezaJuridicaFolio>
            <ns2:fechaAnotacion>{fn:data($payloadResponse/return/listaMedidasCautelares/fechaAnotacion)}</ns2:fechaAnotacion>
                {
                    for $personaCedePredio1 in $listaMedidasCautelares/personaIntervieneActoAnotacionFolio/personaCedePredio
                    return 
                    <ns2:intervinientes>
                        {
                      if (count($payloadResponse/return/listaMedidasCautelares/personaIntervieneActoAnotacionFolio/personaCedePredio/personaNacionalIntervieneActo)!= 0)
                      then <ns2:tipoPersona>Natural</ns2:tipoPersona>
                      else (
                      <ns2:tipoPersona>Jurídica</ns2:tipoPersona>)
                        }
                        <ns2:esPropietario>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/esPropietario)}</ns2:esPropietario>
                        <ns2:tipoDocumentoPersona>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion)}</ns2:tipoDocumentoPersona>
                        {
                            if ($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CC")
                            then <ns2:numDocumentoPersona>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroCedulaCiudadania)}</ns2:numDocumentoPersona>
                            else (if ($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "RC")
                                  then <ns2:numDocumentoPersona>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numRegistroCivil)}</ns2:numDocumentoPersona>
                                  else (if ($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "TI")
                                        then <ns2:numDocumentoPersona>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numTarjetaIdentidad)}</ns2:numDocumentoPersona>
                                        else (if ($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CE")
                                              then <ns2:numDocumentoPersona>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numCedulaExtranjeria)}</ns2:numDocumentoPersona>
                                              else (if ($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "PA")
                                                    then <ns2:numDocumentoPersona>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroPasaporte)}</ns2:numDocumentoPersona>
                                                    else ()
                                      )
                                    )
                                  )
                                )
                            }
                        <ns2:porcentajeParticipacion>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/porcentajeParticipacion)}</ns2:porcentajeParticipacion>
                        <ns2:primerNombre>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/nomPersonaIndividual/primerNombre)}</ns2:primerNombre>
                        <ns2:segundoNombre>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/nomPersonaIndividual/segundoNombre)}</ns2:segundoNombre>
                        <ns2:primerApellido>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/nomPersonaIndividual/primerApellido)}</ns2:primerApellido>
                        <ns2:segundoApellido>{fn:data($personaCedePredio1/personaNacionalIntervieneActo/nomPersonaIndividual/segundoApellido)}</ns2:segundoApellido></ns2:intervinientes>
                }
                
                 
                
            <ns2:NIR></ns2:NIR>
            <ns2:radicacion>{fn:data($payloadResponse/return/datosBasicosInmueble/anotacionCertificadoTradicion/radicacionAnotacion)}</ns2:radicacion>
            <ns2:estadoAnotacion>{fn:data($payloadResponse/return/listaMedidasCautelares/validez)}</ns2:estadoAnotacion>
            <ns2:valorActo>{fn:data($payloadResponse/return/listaMedidasCautelares/valorActo/cantidadMonetaria)}</ns2:valorActo>
            </ns2:medidasCautelares>
        }
        <ns2:codMensaje></ns2:codMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/return/tipoLogResultadoConsulta/mensaje)}</ns2:descripcionMensaje>
        <ns2:numeroConsulta>{fn:data($payloadResponse/return/tipoLogResultadoConsulta/consecutivoConsulta)}</ns2:numeroConsulta>
        <ns2:fechaHoraConsulta>{fn:data($payloadResponse/return/tipoLogResultadoConsulta/fechaHoraConsulta)}</ns2:fechaHoraConsulta>
    </ns2:consultaEstadoJuridicoRespuesta>
};

local:func($payloadResponse)
