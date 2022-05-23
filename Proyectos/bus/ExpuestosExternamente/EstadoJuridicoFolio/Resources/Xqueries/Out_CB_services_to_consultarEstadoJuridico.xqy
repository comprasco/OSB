xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns6="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_EJF_consultarEstadoJuridico.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/anotaciones/consultarAnotaciones/v1";
(:: import schema at "../Schemas/Legacy/CB_A_consultarAnotaciones.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosImueble/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDatosInmueble.xsd" ::)
declare namespace ns5="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarPropietarios/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarPropietarios.xsd" ::)
declare namespace ns3="https://www.supernotariado.gov.co/services/bachue/cb/matriculasrelacionadas/consultarMatriculasDerivadas/v1";
(:: import schema at "../Schemas/Legacy/CB_MR_consultarMatriculasDerivadas.xsd" ::)
declare namespace ns4="https://www.supernotariado.gov.co/services/bachue/cb/matriculasrelacionadas/consultarMatriculasMatriz/v1";
(:: import schema at "../Schemas/Legacy/CB_MR_consultarMatriculasMatriz.xsd" ::)

declare variable $payloadCBConsultarDatosInmueblesResponse as element() (:: schema-element(ns1:salidaDatosInmueble) ::) external;
declare variable $payloadCBConsultarAnotacionesNormalResponse as element() (:: schema-element(ns2:salidaDatosAnotacion) ::) external;
declare variable $payloadCBConsultarAnotacionesMedidaCautelarResponse as element() (:: schema-element(ns2:salidaDatosAnotacion) ::) external;
declare variable $payloadCBConsultarMatriculasDerivadasResponse as element() (:: schema-element(ns3:salidaDatosMatriculasDerivadas) ::) external;
declare variable $payloadCBConsultarMatriculasMatrizResponse as element() (:: schema-element(ns4:salidaDatosMatriculasMatriz) ::) external;
declare variable $payloadCBConsultarPropietariosResponse as element() (:: schema-element(ns5:salidaDatosPropietario) ::) external;

declare function local:func($payloadCBConsultarDatosInmueblesResponse as element() (:: schema-element(ns1:salidaDatosInmueble) ::), 
                            $payloadCBConsultarAnotacionesNormalResponse as element() (:: schema-element(ns2:salidaDatosAnotacion) ::), 
                            $payloadCBConsultarAnotacionesMedidaCautelarResponse as element() (:: schema-element(ns2:salidaDatosAnotacion) ::), 
                            $payloadCBConsultarMatriculasDerivadasResponse as element() (:: schema-element(ns3:salidaDatosMatriculasDerivadas) ::), 
                            $payloadCBConsultarMatriculasMatrizResponse as element() (:: schema-element(ns4:salidaDatosMatriculasMatriz) ::), 
                            $payloadCBConsultarPropietariosResponse as element() (:: schema-element(ns5:salidaDatosPropietario) ::)) 
                            as element() (:: schema-element(ns6:consultaEstadoJuridicoRespuesta) ::) {
    <ns6:consultaEstadoJuridicoRespuesta>
        <ns6:numMatriculaInmobiliaria>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:numMatriculaInmobiliaria)}</ns6:numMatriculaInmobiliaria>
        <ns6:codCirculoRegistral>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codCirculoRegistral)}</ns6:codCirculoRegistral>
        <ns6:nomCirculoRegistral>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomCirculoRegistral)}</ns6:nomCirculoRegistral>
        <ns6:numPredial>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:numPredial)}</ns6:numPredial>
        <ns6:numPredialAnterior>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:numPredialAnterior)}</ns6:numPredialAnterior>
        <ns6:NUPRE>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:NUPRE)}</ns6:NUPRE>
        <ns6:estadoNUPRE>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:estadoNUPRE)}</ns6:estadoNUPRE>
        <ns6:direccionPredio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:direccionPredio)}</ns6:direccionPredio>
        <ns6:codDepartamento>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codDepartamento)}</ns6:codDepartamento>
        <ns6:nomDepartamento>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomDepartamento)}</ns6:nomDepartamento>
        <ns6:codMunicipio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:codMunicipio)}</ns6:codMunicipio>
        <ns6:nomMunicipio>{fn:data($payloadCBConsultarDatosInmueblesResponse/ns1:nomMunicipio)}</ns6:nomMunicipio>
        {
            for $propietarios in $payloadCBConsultarPropietariosResponse/ns5:propietarios
            return 
            <ns6:propietarios>
                <ns6:tipoPersona>{fn:data($propietarios/ns5:tipoPersona)}</ns6:tipoPersona>
                <ns6:tipoDocumentoPersona>{fn:data($propietarios/ns5:tipoDocumentoPersona)}</ns6:tipoDocumentoPersona>
                <ns6:numDocumentoPersona>{fn:data($propietarios/ns5:numDocumentoPersona)}</ns6:numDocumentoPersona>
                <ns6:numNIT>{fn:data($propietarios/ns5:numNIT)}</ns6:numNIT>
                <ns6:primerApellido>{fn:data($propietarios/ns5:primerApellido)}</ns6:primerApellido>
                <ns6:segundoApellido>{fn:data($propietarios/ns5:segundoApellido)}</ns6:segundoApellido>
                <ns6:primerNombre>{fn:data($propietarios/ns5:primerNombre)}</ns6:primerNombre>
                <ns6:segundoNombre>{fn:data($propietarios/ns5:segundoNombre)}</ns6:segundoNombre>
                <ns6:codGenero>{fn:data($propietarios/ns5:codGenero)}</ns6:codGenero>
                <ns6:razonSocial>{fn:data($propietarios/ns5:razonSocial)}</ns6:razonSocial>
                <ns6:porcentajeParticipacion>{fn:data($propietarios/ns5:porcentajeParticipacion)}</ns6:porcentajeParticipacion></ns6:propietarios>
        }
        {
            for $anotaciones in $payloadCBConsultarAnotacionesNormalResponse/ns2:anotaciones
            return 
            <ns6:anotaciones>
                <ns6:numAnotacion>{fn:data($anotaciones/ns2:numAnotacion)}</ns6:numAnotacion>
                {
                    for $anotacionesCanceladas in $anotaciones/ns2:anotacionesCanceladas
                    return 
                    <ns6:anotacionesCanceladas>
                        <ns6:anotacionCancelada>{fn:data($anotacionesCanceladas/ns2:anotacionCancelada)}</ns6:anotacionCancelada></ns6:anotacionesCanceladas>
                }
                <ns6:comentario>{fn:data($anotaciones/ns2:comentario)}</ns6:comentario>
                <ns6:codTipoDocumentoPublico>{fn:data($anotaciones/ns2:codTipoDocumentoPublico)}</ns6:codTipoDocumentoPublico>
                <ns6:fechaDocumento>{fn:data($anotaciones/ns2:fechaDocumento)}</ns6:fechaDocumento>
                <ns6:nomDocumentoPublico>{fn:data($anotaciones/ns2:nomDocumentoPublico)}</ns6:nomDocumentoPublico>
                <ns6:codDominioActoJuridico>{fn:data($anotaciones/ns2:codDominioActoJuridico)}</ns6:codDominioActoJuridico>
                <ns6:nomDominioActoJuridico>{fn:data($anotaciones/ns2:nomDominioActoJuridico)}</ns6:nomDominioActoJuridico>
                <ns6:oficinaOrigen>{fn:data($anotaciones/ns2:oficinaOrigen)}</ns6:oficinaOrigen>
                <ns6:comentarioEspecificoAnotacion>{fn:data($anotaciones/ns2:comentarioEspecificoAnotacion)}</ns6:comentarioEspecificoAnotacion>
                <ns6:DRR>{fn:data($anotaciones/ns2:DRR)}</ns6:DRR>
                <ns6:codNaturalezaJuridicaFolio>{fn:data($anotaciones/ns2:codNaturalezaJuridicaFolio)}</ns6:codNaturalezaJuridicaFolio>
                <ns6:fechaAnotacion>{fn:data($anotaciones/ns2:fechaAnotacion)}</ns6:fechaAnotacion>
                {
                    for $intervinientes in $anotaciones/ns2:intervinientes
                    return 
                    <ns6:intervinientes>
                        <ns6:rolInterviniente>{fn:data($intervinientes/ns2:rolInterviniente)}</ns6:rolInterviniente>
                        <ns6:tipoPersona>{fn:data($intervinientes/ns2:tipoPersona)}</ns6:tipoPersona>
                        <ns6:esPropietario>{fn:data($intervinientes/ns2:esPropietario)}</ns6:esPropietario>
                        <ns6:tipoDocumentoPersona>{fn:data($intervinientes/ns2:tipoDocumentoPersona)}</ns6:tipoDocumentoPersona>
                        <ns6:numDocumentoPersona>{fn:data($intervinientes/ns2:numDocumentoPersona)}</ns6:numDocumentoPersona>
                        <ns6:numNIT>{fn:data($intervinientes/ns2:numNIT)}</ns6:numNIT>
                        <ns6:porcentajeParticipacion>{fn:data($intervinientes/ns2:porcentajeParticipacion)}</ns6:porcentajeParticipacion>
                        <ns6:primerNombre>{fn:data($intervinientes/ns2:primerNombre)}</ns6:primerNombre>
                        <ns6:segundoNombre>{fn:data($intervinientes/ns2:segundoNombre)}</ns6:segundoNombre>
                        <ns6:primerApellido>{fn:data($intervinientes/ns2:primerApellido)}</ns6:primerApellido>
                        <ns6:segundoApellido>{fn:data($intervinientes/ns2:segundoApellido)}</ns6:segundoApellido>
                        <ns6:codGenero>{fn:data($intervinientes/ns2:codGenero)}</ns6:codGenero>
                        <ns6:razonSocial>{fn:data($intervinientes/ns2:razonSocial)}</ns6:razonSocial></ns6:intervinientes>
                }
                <ns6:NIR>{fn:data($anotaciones/ns2:NIR)}</ns6:NIR>
                <ns6:radicacion>{fn:data($anotaciones/ns2:radicacion)}</ns6:radicacion>
                <ns6:estadoAnotacion>{fn:data($anotaciones/ns2:estadoAnotacion)}</ns6:estadoAnotacion>
                <ns6:valorActo>{fn:data($anotaciones/ns2:valorActo)}</ns6:valorActo></ns6:anotaciones>
        }
        {
            for $matriculasMatriz in $payloadCBConsultarMatriculasMatrizResponse/ns4:matriculasMatriz
            return 
            <ns6:matriculasMatriz>
                <ns6:numMatriculaInmobiliaria>{fn:data($matriculasMatriz/ns4:numMatriculaInmobiliaria)}</ns6:numMatriculaInmobiliaria>
                <ns6:codCirculoRegistral>{fn:data($matriculasMatriz/ns4:codCirculoRegistral)}</ns6:codCirculoRegistral></ns6:matriculasMatriz>
        }
        {
            for $matriculasDerivadas in $payloadCBConsultarMatriculasDerivadasResponse/ns3:matriculasDerivadas
            return 
            <ns6:matriculasDerivadas>
                <ns6:numMatriculaInmobiliaria>{fn:data($matriculasDerivadas/ns3:numMatriculaInmobiliaria)}</ns6:numMatriculaInmobiliaria>
                <ns6:codCirculoRegistral>{fn:data($matriculasDerivadas/ns3:codCirculoRegistral)}</ns6:codCirculoRegistral>
                <ns6:direccionPredio>{fn:data($matriculasDerivadas/ns3:direccionPredio)}</ns6:direccionPredio>
                <ns6:NIR>{fn:data($matriculasDerivadas/ns3:NIR)}</ns6:NIR>
                <ns6:radicacion>{fn:data($matriculasDerivadas/ns3:radicacion)}</ns6:radicacion>
                <ns6:anotacionRelacionada>{fn:data($matriculasDerivadas/ns3:anotacionRelacionada)}</ns6:anotacionRelacionada></ns6:matriculasDerivadas>
        }
        {
            for $anotaciones1 in $payloadCBConsultarAnotacionesMedidaCautelarResponse/ns2:anotaciones
            return 
            <ns6:medidasCautelares>
                <ns6:numAnotacion>{fn:data($anotaciones1/ns2:numAnotacion)}</ns6:numAnotacion>
                {
                    for $anotacionesCanceladas1 in $anotaciones1/ns2:anotacionesCanceladas
                    return 
                    <ns6:anotacionesCanceladas>
                        <ns6:anotacionCancelada>{fn:data($anotacionesCanceladas1/ns2:anotacionCancelada)}</ns6:anotacionCancelada></ns6:anotacionesCanceladas>
                }
                <ns6:comentario>{fn:data($anotaciones1/ns2:comentario)}</ns6:comentario>
                <ns6:codTipoDocumentoPublico>{fn:data($anotaciones1/ns2:codTipoDocumentoPublico)}</ns6:codTipoDocumentoPublico>
                <ns6:fechaDocumento>{fn:data($anotaciones1/ns2:fechaDocumento)}</ns6:fechaDocumento>
                <ns6:nomDocumentoPublico>{fn:data($anotaciones1/ns2:nomDocumentoPublico)}</ns6:nomDocumentoPublico>
                <ns6:codDominioActoJuridico>{fn:data($anotaciones1/ns2:codDominioActoJuridico)}</ns6:codDominioActoJuridico>
                <ns6:nomDominioActoJuridico>{fn:data($anotaciones1/ns2:nomDominioActoJuridico)}</ns6:nomDominioActoJuridico>
                <ns6:oficinaOrigen>{fn:data($anotaciones1/ns2:oficinaOrigen)}</ns6:oficinaOrigen>
                <ns6:comentarioEspecificoAnotacion>{fn:data($anotaciones1/ns2:comentarioEspecificoAnotacion)}</ns6:comentarioEspecificoAnotacion>
                <ns6:DRR>{fn:data($anotaciones1/ns2:DRR)}</ns6:DRR>
                <ns6:codNaturalezaJuridicaFolio>{fn:data($anotaciones1/ns2:codNaturalezaJuridicaFolio)}</ns6:codNaturalezaJuridicaFolio>
                <ns6:fechaAnotacion>{fn:data($anotaciones1/ns2:fechaAnotacion)}</ns6:fechaAnotacion>
                {
                    for $intervinientes1 in $anotaciones1/ns2:intervinientes
                    return 
                    <ns6:intervinientes>
                        <ns6:rolInterviniente>{fn:data($intervinientes1/ns2:rolInterviniente)}</ns6:rolInterviniente>
                        <ns6:tipoPersona>{fn:data($intervinientes1/ns2:tipoPersona)}</ns6:tipoPersona>
                        <ns6:esPropietario>{fn:data($intervinientes1/ns2:esPropietario)}</ns6:esPropietario>
                        <ns6:tipoDocumentoPersona>{fn:data($intervinientes1/ns2:tipoDocumentoPersona)}</ns6:tipoDocumentoPersona>
                        <ns6:numDocumentoPersona>{fn:data($intervinientes1/ns2:numDocumentoPersona)}</ns6:numDocumentoPersona>
                        <ns6:numNIT>{fn:data($intervinientes1/ns2:numNIT)}</ns6:numNIT>
                        <ns6:porcentajeParticipacion>{fn:data($intervinientes1/ns2:porcentajeParticipacion)}</ns6:porcentajeParticipacion>
                        <ns6:primerNombre>{fn:data($intervinientes1/ns2:primerNombre)}</ns6:primerNombre>
                        <ns6:segundoNombre>{fn:data($intervinientes1/ns2:segundoNombre)}</ns6:segundoNombre>
                        <ns6:primerApellido>{fn:data($intervinientes1/ns2:primerApellido)}</ns6:primerApellido>
                        <ns6:segundoApellido>{fn:data($intervinientes1/ns2:segundoApellido)}</ns6:segundoApellido>
                        <ns6:codGenero>{fn:data($intervinientes1/ns2:codGenero)}</ns6:codGenero>
                        <ns6:razonSocial>{fn:data($intervinientes1/ns2:razonSocial)}</ns6:razonSocial></ns6:intervinientes>
                }
                <ns6:NIR>{fn:data($anotaciones1/ns2:NIR)}</ns6:NIR>
                <ns6:radicacion>{fn:data($anotaciones1/ns2:radicacion)}</ns6:radicacion>
                <ns6:estadoAnotacion>{fn:data($anotaciones1/ns2:estadoAnotacion)}</ns6:estadoAnotacion>
                <ns6:valorActo>{fn:data($anotaciones1/ns2:valorActo)}</ns6:valorActo></ns6:medidasCautelares>
        }
    </ns6:consultaEstadoJuridicoRespuesta>
};

local:func($payloadCBConsultarDatosInmueblesResponse, $payloadCBConsultarAnotacionesNormalResponse, $payloadCBConsultarAnotacionesMedidaCautelarResponse, $payloadCBConsultarMatriculasDerivadasResponse, $payloadCBConsultarMatriculasMatrizResponse, $payloadCBConsultarPropietariosResponse)
