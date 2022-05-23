xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_EJF_consultarEstadoJuridico.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarPropietarios/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarPropietarios.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaDatosPropietario) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaDatosPropietario) ::)) as element() (:: schema-element(ns2:consultaEstadoJuridicoRespuesta) ::) {
    <ns2:consultaEstadoJuridicoRespuesta>
        <ns2:numMatriculaInmobiliaria></ns2:numMatriculaInmobiliaria>
        <ns2:codCirculoRegistral></ns2:codCirculoRegistral>
        <ns2:nomCirculoRegistral></ns2:nomCirculoRegistral>
        <ns2:numPredial></ns2:numPredial>
        <ns2:numPredialAnterior></ns2:numPredialAnterior>
        <ns2:NUPRE></ns2:NUPRE>
        <ns2:estadoNUPRE></ns2:estadoNUPRE>
        <ns2:direccionPredio></ns2:direccionPredio>
        <ns2:codDepartamento></ns2:codDepartamento>
        <ns2:nomDepartamento></ns2:nomDepartamento>
        <ns2:codMunicipio></ns2:codMunicipio>
        <ns2:nomMunicipio></ns2:nomMunicipio>
        <ns2:propietarios>
            <ns2:tipoPersona>{fn:data($payloadResponse/ns1:propietarios/ns1:tipoPersona)}</ns2:tipoPersona>
            <ns2:tipoDocumentoPersona>{fn:data($payloadResponse/ns1:propietarios/ns1:tipoDocumentoPersona)}</ns2:tipoDocumentoPersona>
            <ns2:numDocumentoPersona>{fn:data($payloadResponse/ns1:propietarios/ns1:numDocumentoPersona)}</ns2:numDocumentoPersona>
            <ns2:numNIT>{fn:data($payloadResponse/ns1:propietarios/ns1:numNIT)}</ns2:numNIT>
            <ns2:primerApellido>{fn:data($payloadResponse/ns1:propietarios/ns1:primerApellido)}</ns2:primerApellido>
            <ns2:segundoApellido>{fn:data($payloadResponse/ns1:propietarios/ns1:segundoApellido)}</ns2:segundoApellido>
            <ns2:primerNombre>{fn:data($payloadResponse/ns1:propietarios/ns1:primerNombre)}</ns2:primerNombre>
            <ns2:segundoNombre>{fn:data($payloadResponse/ns1:propietarios/ns1:segundoNombre)}</ns2:segundoNombre>
            <ns2:codGenero>{fn:data($payloadResponse/ns1:propietarios/ns1:codGenero)}</ns2:codGenero>
            <ns2:razonSocial>{fn:data($payloadResponse/ns1:propietarios/ns1:razonSocial)}</ns2:razonSocial>
            <ns2:porcentajeParticipacion></ns2:porcentajeParticipacion>
        </ns2:propietarios>
        <ns2:anotaciones>
            <ns2:numAnotacion></ns2:numAnotacion>
            <ns2:anotacionesCanceladas>
                <ns2:anotacionCancelada></ns2:anotacionCancelada>
            </ns2:anotacionesCanceladas>
            <ns2:comentario></ns2:comentario>
            <ns2:codTipoDocumentoPublico></ns2:codTipoDocumentoPublico>
            <ns2:fechaDocumento></ns2:fechaDocumento>
            <ns2:nomDocumentoPublico></ns2:nomDocumentoPublico>
            <ns2:codDominioActoJuridico></ns2:codDominioActoJuridico>
            <ns2:nomDominioActoJuridico></ns2:nomDominioActoJuridico>
            <ns2:oficinaOrigen></ns2:oficinaOrigen>
            <ns2:comentarioEspecificoAnotacion></ns2:comentarioEspecificoAnotacion>
            <ns2:DRR></ns2:DRR>
            <ns2:codNaturalezaJuridicaFolio></ns2:codNaturalezaJuridicaFolio>
            <ns2:fechaAnotacion></ns2:fechaAnotacion>
            <ns2:intervinientes>
                <ns2:rolInterviniente></ns2:rolInterviniente>
                <ns2:tipoPersona></ns2:tipoPersona>
                <ns2:esPropietario></ns2:esPropietario>
                <ns2:tipoDocumentoPersona></ns2:tipoDocumentoPersona>
                <ns2:numDocumentoPersona></ns2:numDocumentoPersona>
                <ns2:numNIT></ns2:numNIT>
                <ns2:porcentajeParticipacion></ns2:porcentajeParticipacion>
                <ns2:primerNombre></ns2:primerNombre>
                <ns2:segundoNombre></ns2:segundoNombre>
                <ns2:primerApellido></ns2:primerApellido>
                <ns2:segundoApellido></ns2:segundoApellido>
                <ns2:codGenero></ns2:codGenero>
                <ns2:razonSocial></ns2:razonSocial>
            </ns2:intervinientes>
            <ns2:NIR></ns2:NIR>
            <ns2:radicacion></ns2:radicacion>
            <ns2:estadoAnotacion></ns2:estadoAnotacion>
            <ns2:valorActo></ns2:valorActo>
        </ns2:anotaciones>
        <ns2:matriculasMatriz>
            <ns2:numMatriculaInmobiliaria></ns2:numMatriculaInmobiliaria>
            <ns2:codCirculoRegistral></ns2:codCirculoRegistral>
        </ns2:matriculasMatriz>
        <ns2:matriculasDerivadas>
            <ns2:numMatriculaInmobiliaria></ns2:numMatriculaInmobiliaria>
            <ns2:codCirculoRegistral></ns2:codCirculoRegistral>
            <ns2:direccionPredio></ns2:direccionPredio>
            <ns2:NIR></ns2:NIR>
            <ns2:radicacion></ns2:radicacion>
            <ns2:anotacionRelacionada></ns2:anotacionRelacionada>
        </ns2:matriculasDerivadas>
        <ns2:medidasCautelares>
            <ns2:numAnotacion></ns2:numAnotacion>
            <ns2:anotacionesCanceladas>
                <ns2:anotacionCancelada></ns2:anotacionCancelada>
            </ns2:anotacionesCanceladas>
            <ns2:comentario></ns2:comentario>
            <ns2:codTipoDocumentoPublico></ns2:codTipoDocumentoPublico>
            <ns2:fechaDocumento></ns2:fechaDocumento>
            <ns2:nomDocumentoPublico></ns2:nomDocumentoPublico>
            <ns2:codDominioActoJuridico></ns2:codDominioActoJuridico>
            <ns2:nomDominioActoJuridico></ns2:nomDominioActoJuridico>
            <ns2:oficinaOrigen></ns2:oficinaOrigen>
            <ns2:comentarioEspecificoAnotacion></ns2:comentarioEspecificoAnotacion>
            <ns2:DRR></ns2:DRR>
            <ns2:codNaturalezaJuridicaFolio></ns2:codNaturalezaJuridicaFolio>
            <ns2:fechaAnotacion></ns2:fechaAnotacion>
            <ns2:intervinientes>
                <ns2:rolInterviniente></ns2:rolInterviniente>
                <ns2:tipoPersona></ns2:tipoPersona>
                <ns2:esPropietario></ns2:esPropietario>
                <ns2:tipoDocumentoPersona></ns2:tipoDocumentoPersona>
                <ns2:numDocumentoPersona></ns2:numDocumentoPersona>
                <ns2:numNIT></ns2:numNIT>
                <ns2:porcentajeParticipacion></ns2:porcentajeParticipacion>
                <ns2:primerNombre></ns2:primerNombre>
                <ns2:segundoNombre></ns2:segundoNombre>
                <ns2:primerApellido></ns2:primerApellido>
                <ns2:segundoApellido></ns2:segundoApellido>
                <ns2:codGenero></ns2:codGenero>
                <ns2:razonSocial></ns2:razonSocial>
            </ns2:intervinientes>
            <ns2:NIR></ns2:NIR>
            <ns2:radicacion></ns2:radicacion>
            <ns2:estadoAnotacion></ns2:estadoAnotacion>
            <ns2:valorActo></ns2:valorActo>
        </ns2:medidasCautelares>
        <ns2:codMensaje></ns2:codMensaje>
        <ns2:descripcionMensaje></ns2:descripcionMensaje>
        <ns2:numeroConsulta></ns2:numeroConsulta>
        <ns2:fechaHoraConsulta></ns2:fechaHoraConsulta>
    </ns2:consultaEstadoJuridicoRespuesta>
};

local:func($payloadResponse)
