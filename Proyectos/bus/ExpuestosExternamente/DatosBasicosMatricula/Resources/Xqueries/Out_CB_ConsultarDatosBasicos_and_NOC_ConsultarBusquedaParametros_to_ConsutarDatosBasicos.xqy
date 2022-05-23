xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaBusquedaParametros.xsd_1.xsd" ::)
declare namespace ns3="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosBasicos/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDatosBasicos.xsd" ::)
declare variable $cantidadMatriculas as xs:string external;
declare variable $EstMatriculaAnterior as element() (:: schema-element(ns2:ejecutarBusquedaResponse) ::) external;
declare variable $CBConsultarDatosBasicosResponse as element() (:: schema-element(ns1:salidaDatosBasicos) ::) external;
declare variable $NOCEjecutarBusquedaResponse as element() (:: schema-element(ns2:ejecutarBusquedaResponse) ::) external;

declare function local:func($CBConsultarDatosBasicosResponse as element() (:: schema-element(ns1:salidaDatosBasicos) ::), 
                            $NOCEjecutarBusquedaResponse as element() (:: schema-element(ns2:ejecutarBusquedaResponse) ::),
                            $EstMatriculaAnterior as element() (:: schema-element(ns2:ejecutarBusquedaResponse) ::),
                            $cantidadMatriculas as xs:string) as element() (:: schema-element(ns3:salidaDatosBasicos) ::) {
     <ns3:salidaDatosBasicos>
         <ns3:cantidadMatriculas>{fn:data($cantidadMatriculas)}</ns3:cantidadMatriculas>
        
        {
             for $matriculas at $pos in $CBConsultarDatosBasicosResponse/ns1:matriculas
             return 
             <ns3:matriculas>
                 <ns3:estadoMatricula>{fn:data($matriculas/ns1:estadoMatricula)}</ns3:estadoMatricula>
                 <ns3:estadoMatriculaAnt>{fn:data($EstMatriculaAnterior/return/tipoResultadoCompleto[$pos]/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/estadoMatricula)}</ns3:estadoMatriculaAnt>
                 <ns3:numMatriculaInmobiliaria>{fn:data($matriculas/ns1:numMatriculaInmobiliaria)}</ns3:numMatriculaInmobiliaria>
                 <ns3:codCirculoRegistral>{fn:data($matriculas/ns1:codCirculoRegistral)}</ns3:codCirculoRegistral>
                 <ns3:nomCirculoRegistral>{fn:data($matriculas/ns1:nomCirculoRegistral)}</ns3:nomCirculoRegistral>
                 <ns3:numPredial>{fn:data($matriculas/ns1:numPredial)}</ns3:numPredial>
                 <ns3:estadoNUPRE>{fn:data($matriculas/ns1:estadoNUPRE)}</ns3:estadoNUPRE>
                 <ns3:NUPRE>{fn:data($matriculas/ns1:NUPRE)}</ns3:NUPRE>
                 <ns3:direccionPredio>{fn:data($matriculas/ns1:direccionPredio)}</ns3:direccionPredio>
                 <ns3:codDepartamento>{fn:data($matriculas/ns1:codDepartamento)}</ns3:codDepartamento>
                 <ns3:nomDepartamento>{fn:data($matriculas/ns1:nomDepartamento)}</ns3:nomDepartamento>
                 <ns3:codMunicipio>{fn:data($matriculas/ns1:codMunicipio)}</ns3:codMunicipio>
                 <ns3:nomMunicipio>{fn:data($matriculas/ns1:nomMunicipio)}</ns3:nomMunicipio>
                 <ns3:tipoPredio>{fn:data($matriculas/ns1:tipoPredio)}</ns3:tipoPredio>
                 {
                     for $propietarios in $matriculas/ns1:propietarios
                     return 
                     <ns3:propietarios>
                         <ns3:tipoDocumentoPersona>{fn:data($propietarios/ns1:tipoDocumentoPersona)}</ns3:tipoDocumentoPersona>
                         <ns3:numDocumentoPersona>{fn:data($propietarios/ns1:numDocumentoPersona)}</ns3:numDocumentoPersona>
                         <ns3:numNIT>{fn:data($propietarios/ns1:numNIT)}</ns3:numNIT>
                         <ns3:primerApellido>{fn:data($propietarios/ns1:primerApellido)}</ns3:primerApellido>
                         <ns3:segundoApellido>{fn:data($propietarios/ns1:segundoApellido)}</ns3:segundoApellido>
                         <ns3:primerNombre>{fn:data($propietarios/ns1:primerNombre)}</ns3:primerNombre>
                         <ns3:segundoNombre>{fn:data($propietarios/ns1:segundoNombre)}</ns3:segundoNombre>
                         <ns3:razonSocial>{fn:data($propietarios/ns1:razonSocial)}</ns3:razonSocial>
                         <ns3:porcentajeParticipacion>{fn:data($propietarios/ns1:porcentajeParticipacion)}</ns3:porcentajeParticipacion></ns3:propietarios>
                 }</ns3:matriculas>
         }
         {
             for $tipoResultadoCompleto in $NOCEjecutarBusquedaResponse/return/tipoResultadoCompleto
             return 
             <ns3:matriculas>
            <ns3:estadoMatricula>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/estadoMatricula)}</ns3:estadoMatricula>
            <ns3:numMatriculaInmobiliaria>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/numeroMatriculaInmobiliariaPredio)}</ns3:numMatriculaInmobiliaria>
            <ns3:codCirculoRegistral>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertSal/jurisdiccionPredio)}</ns3:codCirculoRegistral>
            <ns3:nomCirculoRegistral></ns3:nomCirculoRegistral>
            <ns3:numPredial>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/cedulaCatastralPredio)}</ns3:numPredial>
            <ns3:estadoNUPRE></ns3:estadoNUPRE>
            <ns3:NUPRE></ns3:NUPRE>
             {
                if (count($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio)!= 0)
                then (<ns2:direccionPredio>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/nomenclaturaDomiciliariaRural)}</ns2:direccionPredio>,
                <ns2:codDepartamento>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/departamento/codDepartamento)}</ns2:codDepartamento>,
                <ns2:nomDepartamento>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/departamento/nomDepartamento)}</ns2:nomDepartamento>,
                <ns2:codMunicipio>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/municipio/codMunicipio)}</ns2:codMunicipio>,
                <ns2:nomMunicipio>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio/municipio/nomMunicipio)}</ns2:nomMunicipio>)
                else (
                <ns2:direccionPredio>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/nomenclaturaDomiciliariaUrbana)}</ns2:direccionPredio>,
                <ns2:codDepartamento>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/departamento/codDepartamento)}</ns2:codDepartamento>,
                <ns2:nomDepartamento>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/departamento/nomDepartamento)}</ns2:nomDepartamento>,
                <ns2:codMunicipio>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/municipio/codMunicipio)}</ns2:codMunicipio>,
                <ns2:nomMunicipio>{fn:data($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalUrbanaUbicacionPredio/municipio/nomMunicipio)}</ns2:nomMunicipio>
                 )
                }
                {
                if (count($tipoResultadoCompleto/tipoLstCertificadoTradiciLibertEnt/ubicacionMatriculaSistemaSNR/direccionNacionalRuralUbicacionPredio)!= 0)
                then <ns3:tipoPredio>Rural</ns3:tipoPredio>
                else (
                    <ns3:tipoPredio>Urbano</ns3:tipoPredio>
                 )
                }
            
            {
                for $personaRecibePredio in $NOCEjecutarBusquedaResponse/return/tipoResultadoCompleto/tipoLstCertificadoTradiciLibertSal/listaAnotacionTramiteCertificadoTradicion/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio
                where $personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion eq $personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion
                return  
                 <ns3:propietarios>
      
            {
                if (count($NOCEjecutarBusquedaResponse/return/tipoResultadoCompleto/tipoLstCertificadoTradiciLibertSal/listaAnotacionTramiteCertificadoTradicion/anotacionCertificadoTradicion/personaIntervieneActoAnotacionFolio/personaRecibePredio/personaNacionalIntervieneActo)!= 0)
                then <ns3:tipoPersona>Natural</ns3:tipoPersona>
                else (
                <ns3:tipoPersona>Jurídica</ns3:tipoPersona>)
            }
                <ns3:tipoDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion)}</ns3:tipoDocumentoPersona>
            {
                if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CC")
                then <ns3:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroCedulaCiudadania)}</ns3:numDocumentoPersona>
                else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "RC")
                      then <ns3:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numRegistroCivil)}</ns3:numDocumentoPersona>
                      else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "TI")
                            then <ns3:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numTarjetaIdentidad)}</ns3:numDocumentoPersona>
                            else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "CE")
                                  then <ns3:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numCedulaExtranjeria)}</ns3:numDocumentoPersona>
                                  else (if ($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/tipoIdNacionalPersona/codTipoIdentificacion/text()= "PA")
                                        then <ns3:numDocumentoPersona>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/identificacionPersona/grupoNumeroIdentificacion/numeroPasaporte)}</ns3:numDocumentoPersona>
                                        else ()
                      )
                    )
                  )
                )
             }
                <ns3:numNIT>{fn:data($personaRecibePredio/personaJuridicaIntervieneActo/numIdTributaria)}</ns3:numNIT>
                <ns3:primerApellido>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/primerApellido)}</ns3:primerApellido>
                <ns3:segundoApellido>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/segundoApellido)}</ns3:segundoApellido>
                <ns3:primerNombre>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/primerNombre)}</ns3:primerNombre>
                <ns3:segundoNombre>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/nomPersonaIndividual/segundoNombre)}</ns3:segundoNombre>
                <ns3:razonSocial>{fn:data($personaRecibePredio/personaJuridicaIntervieneActo/razonSocial)}</ns3:razonSocial>
                <ns3:porcentajeParticipacion>{fn:data($personaRecibePredio/personaNacionalIntervieneActo/porcentajeParticipacion)}</ns3:porcentajeParticipacion>
               </ns3:propietarios>
            }
             </ns3:matriculas>
         }
       
    </ns3:salidaDatosBasicos>
};

local:func($CBConsultarDatosBasicosResponse, $NOCEjecutarBusquedaResponse, $EstMatriculaAnterior, $cantidadMatriculas)