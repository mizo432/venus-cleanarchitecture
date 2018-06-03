package org.venuspj.cleanArchitecture.useCase;


/**
 * アプリケーションレベルの機能(ユースケース)のインターフェイス.
 *
 * @param <I> ユースケースのインプットポート
 * @param <O> ユースケースのアウトプットポート
 */
public interface UseCaseInteractor<I extends UseCaseInputPort, O extends UseCaseOutputPort> {

    /**
     * ユースケースの開始をします。
     *
     * @param request  リクエスト用インプットポート
     * @param response レスポンス用アウトプットポート
     */
    void start(I request, O response);

}
