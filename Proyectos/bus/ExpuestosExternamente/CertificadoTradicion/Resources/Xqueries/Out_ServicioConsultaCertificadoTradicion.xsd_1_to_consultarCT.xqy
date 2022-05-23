xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaCertificadoTradicion.xsd_1.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:ejecutarResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:ejecutarResponse) ::)) as element() (:: schema-element(ns2:salidaConsultaCT) ::) {
    <ns2:salidaConsultaCT>
        <ns2:nomCirculoRegistral>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/jurisdiccionPredio)}</ns2:nomCirculoRegistral>
        <ns2:numPredial>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/chipCertificadoTradicionActual)}</ns2:numPredial>
        <ns2:numPredialAnterior>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/chipCertificadoTradicionAnterior)}</ns2:numPredialAnterior>
        <ns2:codDepartamento>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/departamentoPredio/codDepartamento)}</ns2:codDepartamento>
        <ns2:nomDepartamento>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/departamentoPredio/nomDepartamento)}</ns2:nomDepartamento>
        <ns2:codMunicipio>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/municipioPredio/codMunicipio)}</ns2:codMunicipio>
        <ns2:nomMunicipio>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/municipioPredio/nomMunicipio)}</ns2:nomMunicipio>
        <ns2:nomVereda>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/vereda/nomCentroPobladoTerritorio)}</ns2:nomVereda>
        <ns2:fechaAperturaFolio>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/fechaAperturaCertificado)}</ns2:fechaAperturaFolio>
        <ns2:fechaInstrumento>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/informacionApertura/fechaInstrumento)}</ns2:fechaInstrumento>
        <ns2:radicacion>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/informacionApertura/numeroRadicacion)}</ns2:radicacion>
        <ns2:nomTipoDocumentoPublico>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/informacionApertura/tipoInstrumentoApertura)}</ns2:nomTipoDocumentoPublico>
        <ns2:estadoFolio>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/estadotFolioCertificadoTradicion/estadoTemporalidadFolio/nomTipoRespuestaSimplificadaTemporalidad)}</ns2:estadoFolio>
        <ns2:linderos>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/linderoPredio)}</ns2:linderos>
        {
            for $personaRecibePredio in $payloadResponse/return/tipoLstCertificadoTradiciLibertSal/listaAnotacionTramiteCertificadoTradicion/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio
            return 
            <ns2:propietarios>
                 {
                if (count($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/listaAnotacionTramiteCertificadoTradicion/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio/personaNacionalIntervieneActo)!= 0)
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
                <ns2:porcentajeParticipacion>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/porcentajeParticipacion)}</ns2:porcentajeParticipacion></ns2:propietarios>
        }
        <ns2:complementaciones>{fn:data($payloadResponse/return/tipoLstCertificadoTradiciLibertSal/complementacionInmuebleCertificadoTradicion)}</ns2:complementaciones>
        {
            for $datoSalvedadCertificadoTradicion in $payloadResponse/return/tipoLstCertificadoTradiciLibertSal/listaSalvedadCertificado/datoSalvedadCertificadoTradicion
            return 
            <ns2:salvedades>
                <ns2:numAnotacion>{fn:data($datoSalvedadCertificadoTradicion/numeroAnotacion)}</ns2:numAnotacion>
                <ns2:numeroCorreccion>{fn:data($datoSalvedadCertificadoTradicion/numeroCorreccion)}</ns2:numeroCorreccion>
                <ns2:radicacion>{fn:data($datoSalvedadCertificadoTradicion/radicacionAnotacion)}</ns2:radicacion>
                <ns2:fechaSalvedad>{fn:data($datoSalvedadCertificadoTradicion/fechaSalvedad)}</ns2:fechaSalvedad>
                <ns2:descripcionSalvedad>{fn:data($datoSalvedadCertificadoTradicion/descripcionSalvedadFolio)}</ns2:descripcionSalvedad></ns2:salvedades>
        }
        {
            for $listaMedidasCautelares in $payloadResponse/return/listaMedidasCautelares
            return 
            <ns2:medidasCautelares>
                <ns2:numAnotacion>{fn:data($listaMedidasCautelares/numeroAnotacion)}</ns2:numAnotacion>
                {
                  for $listaCanceladas in $listaMedidasCautelares/cancelacionAnotacion
                  return
                  <ns2:anotacionesCanceladas>
                      <ns2:anotacionCancelada>{fn:data($listaCanceladas/numeroAnotacion)}</ns2:anotacionCancelada>
                  </ns2:anotacionesCanceladas>
                }
                <ns2:comentario>{fn:data($listaMedidasCautelares/comentario)}</ns2:comentario>
                <ns2:codTipoDocumentoPublico>{fn:data($listaMedidasCautelares/documentoAnotacionCertificadoTradicion/codDocumentoAnotacionFolio)}</ns2:codTipoDocumentoPublico>
                <ns2:fechaDocumento>{fn:data($listaMedidasCautelares/documentoAnotacionCertificadoTradicion/fechaDocumentoAnotacion)}</ns2:fechaDocumento>
                <ns2:nomDocumentoPublico>{fn:data($listaMedidasCautelares/documentoAnotacionCertificadoTradicion/nomDocumentoAnotacionFolio)}</ns2:nomDocumentoPublico>
                <ns2:codDominioActoJuridico>{fn:data($listaMedidasCautelares/dominio)}</ns2:codDominioActoJuridico>
                <ns2:oficinaOrigen>{fn:data($listaMedidasCautelares/entidadAnotacion)}</ns2:oficinaOrigen>
                <ns2:comentarioEspecificoAnotacion>{fn:data($listaMedidasCautelares/especificacionAnotacionFolio/comentarioEspecificaAnotacionFolio)}</ns2:comentarioEspecificoAnotacion>
                <ns2:codNaturalezaJuridicaFolio>{fn:data($listaMedidasCautelares/especificacionAnotacionFolio/naturalezaJuridicaFolio/codNaturalezaJuridicaFolio)}</ns2:codNaturalezaJuridicaFolio>
                <ns2:fechaAnotacion>{fn:data($listaMedidasCautelares/fechaAnotacion)}</ns2:fechaAnotacion>
                <ns2:radicacion>{fn:data($listaMedidasCautelares/radicacionAnotacion)}</ns2:radicacion>
                <ns2:estadoAnotacion>{fn:data($listaMedidasCautelares/validez)}</ns2:estadoAnotacion>
                <ns2:valorActo>{fn:data($listaMedidasCautelares/valorActo/cantidadMonetaria)}</ns2:valorActo>
            </ns2:medidasCautelares>
        }
        {
            for $radicadoCertificadoTradicion in $payloadResponse/return/listaRadicadosEstadoJuridico/radicadoCertificadoTradicion
            return 
            <ns2:tramitesEnCurso>
                <ns2:radicacion>{fn:data($radicadoCertificadoTradicion/numeroRadicacion)}</ns2:radicacion>
                <ns2:fechaRadicacion>{fn:data($radicadoCertificadoTradicion/fechaRadicacion)}</ns2:fechaRadicacion>
                {
                for $listTiposActo in $radicadoCertificadoTradicion/tipoActoTurno
                return
                  <ns2:tiposActo>
                      <ns2:descripcionActo>{fn:data($listTiposActo/descripcionRadicacion)}</ns2:descripcionActo>
                      <ns2:valorActo>{fn:data($listTiposActo/valorActo/cantidadMonetaria)}</ns2:valorActo>
                  </ns2:tiposActo>
                }
                <ns2:oficinaOrigen>{fn:data($radicadoCertificadoTradicion/entidadRadicacion)}</ns2:oficinaOrigen>
                <ns2:nomMunicipio>{fn:data($radicadoCertificadoTradicion/nombreMunicipioRadicacion)}</ns2:nomMunicipio>
            </ns2:tramitesEnCurso>
        }
    </ns2:salidaConsultaCT>
};

local:func($payloadResponse)
