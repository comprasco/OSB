xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaCertificadoTradicion.xsd_1.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/certificadotradicion/consultarct/v1";
(:: import schema at "../Schemas/EE_CT_consultarCT.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultaCT) ::)) as element() (:: schema-element(ns2:ejecutar) ::) {
    <ns2:ejecutar>
        
        <entrada>
            <numeroDirecciones></numeroDirecciones>
            <numeroPropietarios></numeroPropietarios>
            <tipoCirculoRegistral>
                <departamentoCirculoRegistral>
                    <codDepartamento></codDepartamento>
                    <nomDepartamento></nomDepartamento>
                </departamentoCirculoRegistral>
                <jurisdiccionPredio>{fn:substring(fn:data($payloadRequest/ns1:numIdentificacionPredio), 0, 4)}</jurisdiccionPredio>
                <municipioCirculoRegistral>
                    <codMunicipio></codMunicipio>
                    <nomMunicipio></nomMunicipio>
                </municipioCirculoRegistral>
                <nombreJurisdiccionPredio></nombreJurisdiccionPredio>
            </tipoCirculoRegistral>
            <ubicacionMatriculaSistemaSNR>
                <CHIPPredio></CHIPPredio>
                <NITEntidad>
                    <digitoVerificador></digitoVerificador>
                    <numero></numero>
                </NITEntidad>
                <cedulaCatastralPredio></cedulaCatastralPredio>
                <direccionNacionalRuralUbicacionPredio>
                    <claseConcentracionPoblacionDireccionRural>
                        <codClaseConcentracionPoblacion></codClaseConcentracionPoblacion>
                        <nomClaseConcentracionPoblacion></nomClaseConcentracionPoblacion>
                    </claseConcentracionPoblacionDireccionRural>
                    <concentracionPoblacion>
                        <codConcentracionPoblacion></codConcentracionPoblacion>
                        <nomConcentracionPoblacion></nomConcentracionPoblacion>
                    </concentracionPoblacion>
                    <departamento>
                        <codDepartamento></codDepartamento>
                        <nomDepartamento></nomDepartamento>
                    </departamento>
                    <municipio>
                        <codMunicipio></codMunicipio>
                        <nomMunicipio></nomMunicipio>
                    </municipio>
                    <nomenclaturaDomiciliariaRural></nomenclaturaDomiciliariaRural>
                </direccionNacionalRuralUbicacionPredio>
                <direccionNacionalUrbanaUbicacionPredio>
                    <departamento>
                        <codDepartamento></codDepartamento>
                        <nomDepartamento></nomDepartamento>
                    </departamento>
                    <localidad>
                        <codLocalidad></codLocalidad>
                        <nomLocalidad></nomLocalidad>
                    </localidad>
                    <municipio>
                        <codMunicipio></codMunicipio>
                        <nomMunicipio></nomMunicipio>
                    </municipio>
                    <nomBarrio></nomBarrio>
                    <nomenclaturaDomiciliariaUrbana></nomenclaturaDomiciliariaUrbana>
                    <numeroDireccion></numeroDireccion>
                </direccionNacionalUrbanaUbicacionPredio>
                <estadoMatricula></estadoMatricula>
                <identificacionPersona>
                    <grupoNumeroIdentificacion>
                        <numCedulaExtranjeria></numCedulaExtranjeria>
                        <numIdAdultoSinIdentificar></numIdAdultoSinIdentificar>
                        <numIdMenorSinIdentificar></numIdMenorSinIdentificar>
                        <numIdentificacionRecienNacido></numIdentificacionRecienNacido>
                        <numRegistroCivil></numRegistroCivil>
                        <numTarjetaIdentidad></numTarjetaIdentidad>
                        <numeroCedulaCiudadania></numeroCedulaCiudadania>
                        <numeroCedulaExtranjero></numeroCedulaExtranjero>
                        <numeroPasaporte></numeroPasaporte>
                    </grupoNumeroIdentificacion>
                    <tipoIdNacionalPersona>
                        <codTipoIdentificacion></codTipoIdentificacion>
                        <nomTipoIdentificacion></nomTipoIdentificacion>
                    </tipoIdNacionalPersona>
                </identificacionPersona>
                <nomPersonaRelacionadoMatriculaInmobiliaria>
                    <primerApellido></primerApellido>
                    <primerNombre></primerNombre>
                    <segundoApellido></segundoApellido>
                    <segundoNombre></segundoNombre>
                </nomPersonaRelacionadoMatriculaInmobiliaria>
                <nombreEntidad></nombreEntidad>
                <numeroMatriculaInmobiliariaPredio>{fn:substring(fn:data($payloadRequest/ns1:numIdentificacionPredio),4)}</numeroMatriculaInmobiliariaPredio>
            </ubicacionMatriculaSistemaSNR>
        </entrada>
        <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
        <clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</clave>
    </ns2:ejecutar>
};

local:func($payloadRequest)
