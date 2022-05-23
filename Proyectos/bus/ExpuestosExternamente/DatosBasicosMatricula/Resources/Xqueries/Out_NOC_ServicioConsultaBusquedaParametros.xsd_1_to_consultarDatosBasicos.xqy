xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaBusquedaParametros.xsd_1.xsd" ::)
declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare variable $cantidadMatriculas as xs:string external;
declare variable $EstMatriculaAnterior as element() (:: schema-element(ns1:ejecutarBusquedaResponse) ::) external;
declare variable $payloadResponse as element() (:: schema-element(ns1:ejecutarBusquedaResponse) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:ejecutarBusquedaResponse) ::),
                            $EstMatriculaAnterior as element() (:: schema-element(ns1:ejecutarBusquedaResponse) ::),
                            $cantidadMatriculas as xs:string) as element() (:: schema-element(ns2:salidaDatosBasicos) ::) {
    <ns2:salidaDatosBasicos>
        <ns2:cantidadMatriculas>{fn:data($cantidadMatriculas)}</ns2:cantidadMatriculas>
        
        {
             for $matriculas at $pos in $payloadResponse/return/tipoResultadoCompleto
            return 
            <ns2:matriculas>
                 <ns2:estadoMatricula>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/estadoMatricula)}</ns2:estadoMatricula>
                 <ns2:estadoMatriculaAnt>{fn:data($EstMatriculaAnterior/return/tipoResultadoCompleto[$pos]/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/estadoMatricula)}</ns2:estadoMatriculaAnt>
                <ns2:numMatriculaInmobiliaria>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/numeroMatriculaInmobiliariaPredio)}</ns2:numMatriculaInmobiliaria>
                <ns2:codCirculoRegistral>{fn:data($matriculas/tipoLstCertificadoTradiciLibertSal/jurisdiccionPredio)}</ns2:codCirculoRegistral>
                 <ns2:nomCirculoRegistral></ns2:nomCirculoRegistral>
                 <ns2:numPredial>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/cedulaCatastralPredio)}</ns2:numPredial>
                 <ns2:estadoNUPRE></ns2:estadoNUPRE>
                <ns2:NUPRE></ns2:NUPRE>
                {
                if (count($payloadResponse/return/tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio)!= 0)
                then (<ns2:direccionPredio>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/nomenclaturaDomiciliariaRural)}</ns2:direccionPredio>,
                <ns2:codDepartamento>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/departamento/codDepartamento)}</ns2:codDepartamento>,
                <ns2:nomDepartamento>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/departamento/nomDepartamento)}</ns2:nomDepartamento>,
                <ns2:codMunicipio>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/municipio/codMunicipio)}</ns2:codMunicipio>,
                <ns2:nomMunicipio>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/municipio/nomMunicipio)}</ns2:nomMunicipio>)
                else (
                <ns2:direccionPredio>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/nomenclaturaDomiciliariaUrbana)}</ns2:direccionPredio>,
                <ns2:codDepartamento>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/departamento/codDepartamento)}</ns2:codDepartamento>,
                <ns2:nomDepartamento>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/departamento/nomDepartamento)}</ns2:nomDepartamento>,
                <ns2:codMunicipio>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/municipio/codMunicipio)}</ns2:codMunicipio>,
                <ns2:nomMunicipio>{fn:data($matriculas/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/municipio/nomMunicipio)}</ns2:nomMunicipio>
                 )
                }
                
                {
                if (count($payloadResponse/return/tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio)!= 0)
                then <ns2:tipoPredio>Rural</ns2:tipoPredio>
                else (
                    <ns2:tipoPredio>Urbano</ns2:tipoPredio>
                 )
                }
            {
                for $personaRecibePredio in $payloadResponse/return/tipoResultadoCompleto/tipoLstCertificadoTradiciLibertSal/listaAnotacionTramiteCertificadoTradicion/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio
                where $personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion eq $personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion
                return  
                 <ns2:propietarios>
      
            {
                if (count($payloadResponse/return/tipoResultadoCompleto/tipoLstCertificadoTradiciLibertSal/listaAnotacionTramiteCertificadoTradicion/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio/personaNacionalIntervieneActo)!= 0)
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
        </ns2:matriculas>
        }
        <ns2:fechaHoraConsulta>{fn:data($payloadResponse/return/tipoLogResultadoConsulta/fechaHoraConsulta)}</ns2:fechaHoraConsulta>
        <ns2:numeroConsulta>{fn:data($payloadResponse/return/tipoLogResultadoConsulta/consecutivoConsulta)}</ns2:numeroConsulta>
        {
                if (fn:data($payloadResponse/return/tipoLogResultadoConsulta/mensaje)= 'Consulta Exitosa')
                then <ns2:codMensaje>200</ns2:codMensaje>
                else (
                    <ns2:codMensaje>449</ns2:codMensaje>
                 )
                }
        {
                if (fn:data($payloadResponse/return/tipoLogResultadoConsulta/mensaje)= 'Consulta Exitosa')
                then <ns2:descripcionMensaje>OK</ns2:descripcionMensaje>
                else (
                    <ns2:descripcionMensaje>{fn:data($payloadResponse/return/tipoLogResultadoConsulta/mensaje)}</ns2:descripcionMensaje>
                 )
                }
        
 
    </ns2:salidaDatosBasicos>
};

local:func($payloadResponse, $EstMatriculaAnterior,$cantidadMatriculas)