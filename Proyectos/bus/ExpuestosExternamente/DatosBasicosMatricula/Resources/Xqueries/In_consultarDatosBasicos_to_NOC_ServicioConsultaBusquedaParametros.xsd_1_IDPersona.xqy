xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaBusquedaParametros.xsd_1.xsd" ::)
declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:ejecutarBusqueda) ::) {
<ns2:ejecutarBusqueda>



	<entrada>

		<tipoLstCertificadoTradiciLibertEnt>


			<ubicacionMatriculaSistemaSNR>

                    {if ($payloadRequest/ns1:criterioBusqueda='numPredial') then <CHIPPredio>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</CHIPPredio>
                        else()
                        }      



                        {if ($payloadRequest/ns1:criterioBusqueda='numPredial') then <cedulaCatastralPredio>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</cedulaCatastralPredio>
                        else()
                        }                     


				<identificacionPersona>
					<grupoNumeroIdentificacion>
						{
								if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoCC')   then <numeroCedulaCiudadania>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</numeroCedulaCiudadania> 
						  else (if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoCE')  then<numCedulaExtranjeria>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</numCedulaExtranjeria>
						  else(if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoNUIP')  then<numIdentificacionRecienNacido>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</numIdentificacionRecienNacido>
						  else(if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoPA')  then<numeroPasaporte>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</numeroPasaporte>
						  else(if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoTI')  then<numTarjetaIdentidad>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</numTarjetaIdentidad>
						  else()
						  )
						  )
						  )
						  )
						}
					</grupoNumeroIdentificacion>
					<tipoIdNacionalPersona>
                             {
										if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoCC')   then <codTipoIdentificacion>{'CC'}</codTipoIdentificacion> 
								  else (if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoCE')  then<codTipoIdentificacion>{'CE'}</codTipoIdentificacion>
								  else(if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoNUIP')  then<codTipoIdentificacion>{'NUIP'}</codTipoIdentificacion>
								  else(if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoPA')  then<codTipoIdentificacion>{'PA'}</codTipoIdentificacion>
								  else(if ($payloadRequest/ns1:criterioBusqueda='numeroDocumentoTI')  then<codTipoIdentificacion>{'TI'}</codTipoIdentificacion>
								  else()
								  )
								  )
								  )
								  )
								}
						<nomTipoIdentificacion/>
					</tipoIdNacionalPersona>
				</identificacionPersona>

                     {
                    if ($payloadRequest/ns1:criterioBusqueda='matricula') then <numeroMatriculaInmobiliariaPredio>{fn:substring(fn:data($payloadRequest/ns1:valorCriterioBusqueda),4)}</numeroMatriculaInmobiliariaPredio>
                    else()
                    }


			</ubicacionMatriculaSistemaSNR>
		</tipoLstCertificadoTradiciLibertEnt>
	</entrada>
	<sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
	<clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}</clave>
</ns2:ejecutarBusqueda>
};

local:func($payloadRequest)