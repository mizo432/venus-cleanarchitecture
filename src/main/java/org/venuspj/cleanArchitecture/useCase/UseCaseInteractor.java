package org.venuspj.cleanArchitecture.useCase;

/**
 * アプリケーションレベルの機能(ユースケース)のインターフェイス.
 */
public interface UseCaseInteractor<I extends UseCaseInputPort, O extends UseCaseOutputPort> {

    void start(I request, O response);

}
